//
//  FRConjugator.swift
//  Conjugator
//
//  Created by Krzysiek on 26/03/17.
//  Copyright © 2017 krzysp.net. All rights reserved.
//

import UIKit

class FRConjugatorPrototype: ConjugatorPrototype
{
    var ending          : String?
    var aux             : String?
    var ppresent        : String?
    var ppasse          : String?
    var present         : String?
    var imparfait       : String?
    var passe           : String?
    var futur           : String?
    var spresent        : String?
    var simparfait      : String?
    var imperatif       : String?
    var condition       : String?
}

public class FRConjugatorModule: NSObject, ConjugatorModuleProtocol, XMLParserDelegate
{
    // MARK: - Prototypes
    private var xmlURL          : URL
    private var isInitialized   : Bool = false
    
    private var prototypes      : [ConjugatorPrototype]
    private var persons         : [ConjugatorPerson]?
    private var tenses          : [ConjugatorTense]?
    
    // MARK: - Module private definitions
    private struct Constants
    {
        // act like indexes
        public static let Person1_Je = 0
        public static let Person2_Tu = 1
        public static let Person3_Il = 2

        public static let Person4_Nous = 3
        public static let Person5_Vous = 4
        public static let Person6_Ils  = 5
        
        // act like indexes
        public static let Tense_Present = 0
        public static let Tense_Imparfait = 1
        public static let Tense_PasseCompose = 2
        
    }
    
    // MARK: - Module initialization
    init(withRulesXMLPath : URL)
    {
        self.xmlURL = withRulesXMLPath
        self.prototypes = []
        super.init()
    }
    
    // MARK: - ConjugatorModuleProtocol
    public func getModuleName() -> String
    {
        return "French Verb Conjugator"
    }
    
    public func getModuleVersion() -> String
    {
        return "1.0"
    }
    
    public func getModulePrototypes() -> [ConjugatorPrototype]
    {
        initializeIfNeeded()
        return self.prototypes
    }
    
    public func getPersons() -> [ConjugatorPerson]
    {
        if self.persons == nil
        {
            self.persons = [
                ConjugatorPerson.init(withPersonIndex: Constants.Person1_Je,      withPersonString: "je")
                , ConjugatorPerson.init(withPersonIndex: Constants.Person2_Tu,      withPersonString: "tu")
                , ConjugatorPerson.init(withPersonIndex: Constants.Person3_Il,      withPersonString: "il/elle")
                , ConjugatorPerson.init(withPersonIndex: Constants.Person4_Nous,    withPersonString: "nous")
                , ConjugatorPerson.init(withPersonIndex: Constants.Person5_Vous,    withPersonString: "vous")
                , ConjugatorPerson.init(withPersonIndex: Constants.Person6_Ils,     withPersonString: "ils/elles")
            ]
        }
        
        return self.persons!
    }
    
    public func getTenses() -> [ConjugatorTense]
    {
        if self.tenses == nil
        {
            self.tenses = [
                ConjugatorTense.init(withTenseIndex: Constants.Tense_Present, withTenseString: "présent"),
                ConjugatorTense.init(withTenseIndex: Constants.Tense_Imparfait, withTenseString: "imparfait")
            ]
        }
        
        return self.tenses!
    }
    
    public func conjugate(withVerb verb : String, withPrototype prototype : ConjugatorPrototype, withPerson person : ConjugatorPerson, withTense tense : ConjugatorTense) -> String?
    {
        let frPrototype = prototype as! FRConjugatorPrototype
        var matchedInsideRegexInVerb : String?
        
        let matches : [NSTextCheckingResult] = prototype.regularExpression!.matches(in: verb, options: [], range: NSRange.init(location: 0, length: verb.utf16.count))
        if matches.count > 0
        {
            let matchingResult : NSTextCheckingResult = matches[0]
            if matchingResult.numberOfRanges > 1
            {
                let range : NSRange = matchingResult.rangeAt(1)
                matchedInsideRegexInVerb = verb.substring(with: verb.convertToRange(from:range)!)
            }
        }
    
        var componentsString : String?
        
        switch tense.tenseIndex
        {
            case Constants.Tense_Present:
                componentsString = frPrototype.present
                let components : [String] = componentsString!.components(separatedBy: ",")
                if components.count == 6
                {
                    if person.personIndex < components.count
                    {
                        return combineConjugasion(withVerb: verb, withEnding: frPrototype.ending!, withSelectedEnding: components[person.personIndex], matchedInsideRegexInVerb: matchedInsideRegexInVerb)
                    }
                }
            
            case Constants.Tense_Imparfait:
                componentsString = frPrototype.imparfait
                let components : [String] = componentsString!.components(separatedBy: ",")
                if components.count == 6
                {
                    if person.personIndex < components.count
                    {
                        return combineConjugasion(withVerb: verb, withEnding: frPrototype.ending!, withSelectedEnding: components[person.personIndex], matchedInsideRegexInVerb: matchedInsideRegexInVerb)
                    }
                }
            
            default:
                return nil
        }
        return nil
    }
    
    private func combineConjugasion(withVerb verb: String,
                                    withEnding ending: String,
                                    withSelectedEnding selectedEnding: String,
                                    matchedInsideRegexInVerb: String?) -> String?
    {
        if selectedEnding.utf16.count > 0
        {
            var result : String?
            var processedEnding = selectedEnding
            
            // check the possibiliy of an inner match
            if processedEnding.range(of: "?") != nil && matchedInsideRegexInVerb != nil
            {
                processedEnding = selectedEnding.replacingOccurrences(of: "?", with: matchedInsideRegexInVerb!)
            }
            
            let range = verb.range(of: ending, options: String.CompareOptions.backwards, range: nil, locale: nil)
            if range != nil
            {
                // preprocess
                let nrRange = verb.convertToNSRange(from: range!)
                if nrRange.location < verb.utf16.count
                {
                    let radical = verb.substring(to: range!.lowerBound)
                    result = radical.appending(processedEnding)
                }
                
                // process
                if result != nil
                {
                    let rangeOfPossibleAlternateEnding = result?.range(of: "|")
                    if rangeOfPossibleAlternateEnding != nil
                    {
                        result = result!.substring(to: (rangeOfPossibleAlternateEnding?.lowerBound)!)
                    }
                }
                
                return result
            }
        }
        
        return nil
    }
    
    // MARK: - Internal consistency
    private func initializeIfNeeded() -> Swift.Void
    {
        if !isInitialized
        {
            isInitialized = true
            
            let parser = XMLParser.init(contentsOf: xmlURL)
            parser!.delegate = self
            parser!.parse()
        }
    }
    
    // MARK: - Parser delegate
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:])
    {
        if elementName == "Prototype"
        {
            let prototype : FRConjugatorPrototype = FRConjugatorPrototype.init(withRegexString: attributeDict["REGEX"]!)
            
            prototype.ending = attributeDict["ENDING"]
            prototype.aux = attributeDict["AUX"]
            prototype.ppresent = attributeDict["PPRESENT"]
            prototype.ppasse = attributeDict["PPASSÉ"]
            prototype.present = attributeDict["PRÉSENT"]
            prototype.imparfait = attributeDict["IMPARFAIT"]
            prototype.passe = attributeDict["PASSÉ"]
            prototype.futur = attributeDict["FUTUR"]
            prototype.spresent = attributeDict["SPRÉSENT"]
            prototype.simparfait = attributeDict["SIMPARFAIT"]
            prototype.imperatif = attributeDict["IMPÉRATIF"];
            prototype.condition = attributeDict["CONDITION"];

            self.prototypes.append(prototype)
        }
    }
}

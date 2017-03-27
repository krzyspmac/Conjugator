//
//  Conjugator.swift
//  Conjugator
//
//  Created by Krzysiek on 26/03/17.
//  Copyright © 2017 krzysp.net. All rights reserved.
//

import UIKit

@objc public class Conjugator: NSObject
{
    // MARK: - Variables
    private var module : ConjugatorModuleProtocol
    
    // MARK: - Initializers
    override public init()
    {
        let bundle = Bundle.init(for: type(of: self))
        let frBundleUrl = bundle.url(forResource: "ConjugatorBundle", withExtension: "bundle")
        let frBundle = Bundle.init(url: frBundleUrl!)
        let verbsUrl = frBundle?.url(forResource: "verbs", withExtension: "xml")!
        
        self.module = FRConjugatorModule.init(withRulesXMLPath: verbsUrl!)
    }
    
    // MARK: - Conjugate
    public func getConjugatorPersons() -> [ConjugatorPerson]
    {
        return module.getPersons()
    }
    
    public func getConjugatorTenses() -> [ConjugatorTense]
    {
        return module.getTenses()
    }
    
    open func conjugate(verb: String, withPerson person: ConjugatorPerson, withTense tense: ConjugatorTense) -> String?
    {
        return conjugate(verb: verb, withPerson: person, withTense: tense, includeAuxVerbs: false)
    }
    
    open func conjugate(verb: String, withPerson person: ConjugatorPerson, withTense tense: ConjugatorTense, includeAuxVerbs auxVerbs : Bool = false) -> String?
    {
        return self.module.conjugate(withVerb: verb, withPerson: person, withTense: tense, useAuxVerb: auxVerbs)
    }
}

// Conjugaator Prototype base class
@objc public class ConjugatorPrototype: NSObject
{
    // MARK: - Read paremeters from the rules XML file
    // others should be defined in respective subclasses
    public var regexString                      : String
    
    // lazy laoded regular expression
    lazy var regularExpression                  : NSRegularExpression? = self.initializeRegularExpression()
    
    // MARK: - Initializer
    init(withRegexString: String)
    {
        regexString = withRegexString
        super.init()
    }
    
    private func initializeRegularExpression() -> NSRegularExpression?
    {
        do
        {
            return try NSRegularExpression.init(pattern: self.regexString, options: [NSRegularExpression.Options.useUnicodeWordBoundaries])
        }
        catch {}
        
        return nil
    }
}

@objc public class ConjugatorPerson: NSObject
{
    public private(set) var personIndex     : Int
    public private(set) var personString    : String
    
    init(withPersonIndex: Int, withPersonString: String)
    {
        self.personIndex = withPersonIndex
        self.personString = withPersonString
        super.init()
    }
}

public class ConjugatorTense: NSObject
{
    public private(set) var tenseIndex      : Int
    public private(set) var tenseString     : String
    
    init(withTenseIndex: Int, withTenseString : String)
    {
        self.tenseIndex = withTenseIndex
        self.tenseString = withTenseString
        super.init();
    }
}

// Conjugator module protocol
public protocol ConjugatorModuleProtocol
{
    // all of the following methods can be called often; keep a cache around
    func getModuleName() -> String
    func getModuleVersion() -> String
    func getPersons() -> [ConjugatorPerson]
    func getTenses() -> [ConjugatorTense]
    func conjugate(withVerb verb : String, withPerson person : ConjugatorPerson, withTense tense : ConjugatorTense, useAuxVerb useAux : Bool) -> String?
}

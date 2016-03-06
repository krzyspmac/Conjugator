//
//  Conjugator.m
//  Fr.Conjug
//
//  Created by Krzysiek on 29.08.2015.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import "Conjugator.h"

static NSArray * rulesArray = Nil;

@interface ConjugatorPrototype : NSObject
{
    NSRegularExpression * _regularExpression;
}

@property (nonatomic, strong) NSString * regex;
@property (nonatomic, strong) NSString * ending;
@property (nonatomic, strong) NSString * aux;
@property (nonatomic, strong) NSString * ppresent;
@property (nonatomic, strong) NSString * ppasse;
@property (nonatomic, strong) NSString * present;
@property (nonatomic, strong) NSString * imparfait;
@property (nonatomic, strong) NSString * passe;
@property (nonatomic, strong) NSString * futur;
@property (nonatomic, strong) NSString * spresent;
@property (nonatomic, strong) NSString * simparfait;
@property (nonatomic, strong) NSString * imperatif;
@property (nonatomic, strong) NSString * condition;

- (NSRegularExpression*)regularExpression;

@end

@interface Conjugator () <NSXMLParserDelegate>
@property (nonatomic, strong) NSMutableArray * parsingRules;
@property (nonatomic, strong) NSArray * prototypeRules;
@property (nonatomic, strong) NSRegularExpression * regularExpression;
@end

@implementation Conjugator

- (id)initWithContentsOfRulesXML:(NSURL*)rulesXMLURL;
{
    self = [super init];
    if( self ) {
        NSXMLParser * parser = [[NSXMLParser alloc] initWithContentsOfURL:rulesXMLURL];
        parser.delegate = self;
        self.parsingRules = [[NSMutableArray alloc] init];
        if( [parser parse] ) {
            self.prototypeRules = [_parsingRules copy];
        }
        else {
            NSLog(@"Could not parse xml");
        }
        self.parsingRules = Nil;
        parser = Nil;
    }
    return self;
}

- (id)init; // with default verbs.xml file; should be included with the library itself
{
    NSBundle * bundle = [NSBundle bundleForClass:[self class]];
    NSURL * urlToVerbsDefinition = [bundle URLForResource:@"verbs" withExtension:@"xml"];
    self = [self initWithContentsOfRulesXML:urlToVerbsDefinition];
    return self;
}

#pragma mark - XML Parse

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    if( [elementName isEqualToString:@"Prototype"] ) {
        ConjugatorPrototype * prototype = [[ConjugatorPrototype alloc] init];
        prototype.regex = attributeDict[@"REGEX"];
        prototype.ending = attributeDict[@"ENDING"];
        prototype.aux = attributeDict[@"AUX"];
        prototype.ppresent = attributeDict[@"PPRESENT"];
        prototype.ppasse = attributeDict[@"PPASSÉ"];
        prototype.present = attributeDict[@"PRÉSENT"];
        prototype.imparfait = attributeDict[@"IMPARFAIT"];
        prototype.passe = attributeDict[@"PASSÉ"];
        prototype.futur = attributeDict[@"FUTUR"];
        prototype.spresent = attributeDict[@"SPRÉSENT"];
        prototype.simparfait = attributeDict[@"SIMPARFAIT"];
        prototype.imperatif = attributeDict[@"IMPÉRATIF"];
        prototype.condition = attributeDict[@"CONDITION"];
        
        [prototype regularExpression]; // will initialize
        [_parsingRules addObject:prototype];
    }
}

#pragma mark - Conjugate

- (NSString*)conjugateVerb:(NSString*)verb type:(Conjugator_Person)person mode:(Conjugator_Tense)tense options:(Conjugator_Option)options;
{
    NSString * result = Nil;
    NSRange regexSearchRange = NSMakeRange(0, verb.length);
    
    __block ConjugatorPrototype * foundPrototype = Nil;
    __block NSRegularExpression * foundRegularExpression = Nil;
    __block NSString * matchedInsideRegexInVerb = Nil;
    
    for( ConjugatorPrototype * aPrototype in _prototypeRules ) {
        NSRegularExpression * regex = aPrototype.regularExpression;
        if( regex == Nil ) {
            // a wrong regex!
            continue;
        }
        
        @try {
            if( [regex numberOfMatchesInString:verb options:0 range:regexSearchRange] > 0 ) {
                NSArray * matches = [regex matchesInString:verb options:0 range:regexSearchRange];
                if( matches.count ) {
                    NSTextCheckingResult * matchingResult = matches[0];
                    NSInteger numberOfRanges = [matchingResult numberOfRanges];
                    if( numberOfRanges > 1 ) {
                        NSRange range = [matchingResult rangeAtIndex:1];
                        matchedInsideRegexInVerb = [verb substringWithRange:range];
                    }
                }
                foundPrototype = aPrototype;
                foundRegularExpression = regex;
                break;
            }
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
    }
    
    if( foundPrototype ) {
        NSString * componentsString = Nil;
        
        NSString * (^CombineConjugasion)(NSString*, NSString*, NSString*) = ^ NSString * (NSString * verb, NSString * ending, NSString * selectedEnding) {
            NSString * result = Nil;
            if( selectedEnding.length ) {
                NSString * processedEnding = selectedEnding;
                if( [processedEnding rangeOfString:@"?"].location != NSNotFound && matchedInsideRegexInVerb ) { // ? replaces a found string inside the regex
                    processedEnding = [selectedEnding stringByReplacingOccurrencesOfString:@"?" withString:matchedInsideRegexInVerb];
                }
                NSRange range = [verb rangeOfString:ending options:NSBackwardsSearch];
                if( range.location != NSNotFound && range.location < verb.length ) {
                    NSString * radical = [verb substringToIndex:range.location];
                    result = [radical stringByAppendingString:processedEnding];
                }
                
                NSRange rangeOfPossibleAlternateEnding = [result rangeOfString:@"|"];
                if( rangeOfPossibleAlternateEnding.location != NSNotFound ) {
                    result = [result substringToIndex:rangeOfPossibleAlternateEnding.location];
                }
            }
            
            return result;
        };
        
        switch(tense){
            case ConjugatorTense_Present:
            {
                componentsString = foundPrototype.present;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 6 ) {
                    if( person < components.count ) {
                        result = CombineConjugasion(verb, foundPrototype.ending, components[person]);
                    }
                    else {
                        NSLog(@"Conjugator type is higher than possible components indices");
                    }
                }
                else {
                    NSLog(@"Wrong number of components!");
                }
                break;
            }
            case ConjugatorTense_Imparfait:
            {
                componentsString = foundPrototype.imparfait;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 6 ) {
                    if( person < components.count ) {
                        result = CombineConjugasion(verb, foundPrototype.ending, components[person]);
                    }
                    else {
                        NSLog(@"Conjugator type is higher than possible components indices");
                    }
                }
                else {
                    NSLog(@"Wrong number of components!");
                }
                break;
            }
            case ConjugatorTense_PasseCompose:
            {
                componentsString = foundPrototype.ppasse;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 4 ) {
                    NSString * auxVerb = foundPrototype.aux;
                    NSString * conjugatedPasseCompose = Nil;
                    
                    BOOL isFalloir = [verb isEqualToString:@"falloir"];
                    BOOL shouldConjugate = !isFalloir || (isFalloir && person == Conjugator_Il_Elle);
                    
                    if( shouldConjugate ) {
                        if( ![auxVerb isEqualToString:@"avoir"] ) {
                            conjugatedPasseCompose = CombineConjugasion(verb, foundPrototype.ending, components[ (person >= Conjugator_Je && person <= Conjugator_Il_Elle) ? 0 : 2 ]);
                        }
                        else {
                            conjugatedPasseCompose = CombineConjugasion(verb, foundPrototype.ending, components[0]);
                        }
                        
                        if( options & ConjugatorOption_IncludeAxuliaryVerb ) {
                            NSString * conjugatedAux = [self conjugateVerb:auxVerb type:person mode:ConjugatorTense_Present options:0];
                            result = [NSString stringWithFormat:@"%@ %@", conjugatedAux, conjugatedPasseCompose];
                        }
                        else {
                            result = conjugatedPasseCompose;
                        }
                    }
                }
                else {
                    NSLog(@"Wrong number of components!");
                }
                break;
            }
            default:
                NSLog(@"Unknown mode: %ld", (long)foundPrototype);
        }

    }
    
    return result;
}

+ (NSString*)textForPerson:(Conjugator_Person)person;
{
    static NSString * Persons[6] = { @"je", @"tu", @"il/elle", @"nous", @"vous", @"ils/elles" };
    NSString * result = Persons[person];
    return result;
}

@end


@interface ConjugatorPrototype ()
@property (nonatomic, assign) BOOL didInitialize;
@end

@implementation ConjugatorPrototype

- (NSString *)description;
{
    return [NSString stringWithFormat:@"<%@ 0x%lx regex=%@", NSStringFromClass([self class]), (unsigned long)self,
            _regex
            ];
}

- (NSRegularExpression*)regularExpression;
{
    if( !_regularExpression && !_didInitialize ) {
        self.didInitialize = YES;
        NSError * error;
        _regularExpression = [[NSRegularExpression alloc] initWithPattern:_regex options:NSRegularExpressionUseUnicodeWordBoundaries error:&error];
        if( !_regularExpression ) {
            NSLog(@"Could not initialize regex: %@ with error: %@", _regex, error);
        }
    }
    return _regularExpression;
}

@end

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

- (NSString*)conjugateVerb:(NSString*)verb type:(Conjugator_Person)type mode:(Conjugator_Mode)mode;
{
    NSString * result = Nil;
    NSRange regexSearchRange = NSMakeRange(0, verb.length);
    
    ConjugatorPrototype * foundPrototype = Nil;
    
    for( ConjugatorPrototype * aPrototype in _prototypeRules ) {
        NSRegularExpression * regex = aPrototype.regularExpression;
        if( regex == Nil ) {
            // a wrong regex!
            continue;
        }
        
        @try {
            if( [regex numberOfMatchesInString:verb options:0 range:regexSearchRange] > 0 ) {
                foundPrototype = aPrototype;
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
            NSRange range = [verb rangeOfString:ending];
            NSString * radical = [verb substringToIndex:range.location];
            NSString * result = [radical stringByAppendingString:selectedEnding];
            return result;
        };
        
        switch(mode){
            case ConjugatorMode_Present:
            {
                componentsString = foundPrototype.present;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 6 ) {
                    if( type < components.count ) {
                        result = CombineConjugasion(verb, foundPrototype.ending, components[type]);
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
            case ConjugatorMode_Imparfait:
            {
                componentsString = foundPrototype.imparfait;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 6 ) {
                    if( type < components.count ) {
                        result = CombineConjugasion(verb, foundPrototype.ending, components[type]);
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
            case ConjugatorMode_PPasse:
            {
                componentsString = foundPrototype.ppasse;
                NSArray * components = [componentsString componentsSeparatedByString:@","];
                if( components.count == 4 ) {
                    if( type < components.count ) {
                        result = CombineConjugasion(verb, foundPrototype.ending, components[ (type >= Conjugator_Je && type <= Conjugator_Il_Elle) ? 0 : 2 ]);
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

//
//  Conjugator.h
//  Fr.Conjug
//
//  Created by Krzysiek on 29.08.2015.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    Conjugator_Je               = 0,
    Conjugator_Tu               = 1,
    Conjugator_Il_Elle          = 2,
    
    Conjugator_Nous             = 3,
    Conjugator_Vous             = 4,
    Conjugator_Ils_Elles        = 5,
} Conjugator_Person;

typedef enum : NSUInteger {
    ConjugatorMode_Present,
    ConjugatorMode_PPasse, 
    ConjugatorMode_Imparfait
} Conjugator_Mode;

@interface Conjugator : NSObject

- (id)init; // with default verbs.xml file; should be included with the library itself
- (id)initWithContentsOfRulesXML:(NSURL*)rulesXMLURL;
@property (nonatomic, readonly) NSArray * prototypeRules;

- (NSString*)conjugateVerb:(NSString*)verb type:(Conjugator_Person)type mode:(Conjugator_Mode)mode;

+ (NSString*)textForPerson:(Conjugator_Person)person;

@end

//
//  Conjugator.h
//  Fr.Conjug
//
//  Created by Krzysiek on 29.08.2015.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Conjugator persons.
 */
typedef enum : NSUInteger {
    FRConjugator_Je               = 0,
    FRConjugator_Tu               = 1,
    FRConjugator_Il_Elle          = 2,
    
    FRConjugator_Nous             = 3,
    FRConjugator_Vous             = 4,
    FRConjugator_Ils_Elles        = 5,
} FRConjugator_Person;

/**
 Conjugator tenses.
 */
typedef enum : NSUInteger {
    FRConjugatorTense_Present           = 0,
    FRConjugatorTense_PasseCompose      = 1,
    FRConjugatorTense_Imparfait         = 2
} FRConjugator_Tense;

/**
 Conjugator options
 */
typedef enum : NSUInteger {
    FRConjugatorOption_IncludeAxuliaryVerb   = 1
} FRConjugator_Option;

@interface FRConjugatorController : NSObject

/**
 Default initializer. Will try to initialize with -initWithContentsOfRulesXML: and use the verbs.xml that is include in the shared library.
 */
- (id)init;

/**
 Custom initializer. Give an URL to the vers.xml file.
 */
- (id)initWithContentsOfRulesXML:(NSURL*)rulesXMLURL;

/**
 Return an array with rules loaded off the verbs.xml
 */
@property (nonatomic, readonly) NSArray * prototypeRules;

/**
 Return `je' for FRConjugator_Je, `tu' for FRConjugator_Tu, etc.
 */
+ (NSString*)textForPerson:(FRConjugator_Person)person;

/**
 Conjugate the appropriate person using given mode.
 */
- (NSString*)conjugateVerb:(NSString*)verb type:(FRConjugator_Person)person mode:(FRConjugator_Tense)tense options:(FRConjugator_Option)options;

@end

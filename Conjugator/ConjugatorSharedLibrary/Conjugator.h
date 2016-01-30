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
    Conjugator_Je               = 0,
    Conjugator_Tu               = 1,
    Conjugator_Il_Elle          = 2,
    
    Conjugator_Nous             = 3,
    Conjugator_Vous             = 4,
    Conjugator_Ils_Elles        = 5,
} Conjugator_Person;

/**
 Conjugator tenses.
 */
typedef enum : NSUInteger {
    ConjugatorTense_Present,
    ConjugatorTense_PasseCompose, 
    ConjugatorTense_Imparfait
} Conjugator_Tense;

/**
 Conjugator options
 */
typedef enum : NSUInteger {
    ConjugatorOption_IncludeAxuliaryVerb   = 1
} ConjugatorOption;

@interface Conjugator : NSObject

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
 Return `je' for Conjugator_Je, `tu' for Conjugator_Tu, etc.
 */
+ (NSString*)textForPerson:(Conjugator_Person)person;

/**
 Conjugate the appropriate person using given mode.
 */
- (NSString*)conjugateVerb:(NSString*)verb type:(Conjugator_Person)person mode:(Conjugator_Tense)tense options:(ConjugatorOption)options;

@end

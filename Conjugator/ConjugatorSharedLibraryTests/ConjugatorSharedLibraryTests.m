//
//  ConjugatorSharedLibraryTests.m
//  ConjugatorSharedLibraryTests
//
//  Created by Krzysiek on 14/12/15.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <ConjugatorSharedLibrary/Conjugator.h>

@interface Conjugator_Tests : XCTestCase
@property (nonatomic, strong) Conjugator * conjugator;
@end

@implementation Conjugator_Tests

- (void)setUp
{
    [super setUp];
    self.conjugator = [[Conjugator alloc] init];
}

- (void)tearDown;
{
    [super tearDown];
}

- (void)testRulesParse;
{
    XCTAssertNotNil([_conjugator prototypeRules], @"No rules parsed");
    XCTAssertTrue([_conjugator prototypeRules].count > 0, @"Too few rules!");
}

- (void)testSimpleConjugation;
{
    NSString * result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorTense_Present options:0];
    XCTAssertNotNil(result, @"Must have a result");
    XCTAssertTrue([result isEqualToString:@"suis"], @"Wrong conjugation returned");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"mener" type:Conjugator_Tu mode:ConjugatorTense_Present options:0] isEqualToString:@"mènes"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Tu mode:ConjugatorTense_Present options:0] isEqualToString:@"es"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Il_Elle mode:ConjugatorTense_Present options:0] isEqualToString:@"est"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Nous mode:ConjugatorTense_Present options:0] isEqualToString:@"sommes"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Vous mode:ConjugatorTense_Present options:0] isEqualToString:@"êtes"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorTense_Present options:0] isEqualToString:@"sont"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorTense_Imparfait options:0] isEqualToString:@"étais"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"soumets"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:Conjugator_Je mode:ConjugatorTense_PasseCompose options:0] isEqualToString:@"soumis"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"permettre" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"permets"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"servir" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"sers"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"sais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"chercher" type:Conjugator_Nous mode:ConjugatorTense_Present options:0] isEqualToString:@"cherchons"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"sais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"concerner" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"concerne"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"consolider" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"consolide"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"écrire" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"écris"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"appelle"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:Conjugator_Je mode:ConjugatorTense_PasseCompose options:0] isEqualToString:@"appelé"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"jeter" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"jette"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"perdre" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"perds"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"relever" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"relève"], @"Wrong conjugation result");

    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorTense_Present options:0] isEqualToString:@"considère"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorTense_Imparfait options:0] isEqualToString:@"considérais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorTense_PasseCompose options:0] isEqualToString:@"considéré"], @"Wrong conjugation result");
    
    // only the third person; so far doesn't work; TODO
    //XCTAssertTrue([[_conjugator conjugateVerb:@"falloir" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sers"], @"Wrong conjugation result");
}

- (void)testParticipePasse;
{
    NSString * result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorTense_PasseCompose options:0];
    XCTAssertNotNil(result, @"Must have a result");
    XCTAssertTrue([result isEqualToString:@"été"], @"Wrong conjugation returned");
}

- (void)testSpeed;
{
    __block NSString * result = Nil;
    [self measureBlock:^{
        result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorTense_Present options:0];
    }];
}

- (void)testVerbs;
{
    NSBundle * testBundle = [NSBundle bundleForClass:[self class]];
    NSString * conjugatedVerbsBundlePath = [testBundle pathForResource:@"ConjugatedVerbs" ofType:Nil];
    XCTAssertNotNil(conjugatedVerbsBundlePath, @"Path must exist");
    
    NSBundle * conjugatedVerbsBundle = [[NSBundle alloc] initWithPath:conjugatedVerbsBundlePath];
    XCTAssertNotNil(conjugatedVerbsBundle, @"Bundle must exist");
    
    NSDictionary * verbsDictionary = [[NSDictionary alloc] initWithContentsOfFile:[conjugatedVerbsBundle pathForResource:@"verbs" ofType:@"plist"]];
    XCTAssertNotNil(verbsDictionary, @"NSDictionary must exist");
    
    NSArray * simpleVerbs = verbsDictionary[@"beginner"];
    XCTAssertNotNil(verbsDictionary, @"Simple verb array must exist");
    
    NSArray * personsToTest = @[ @"je", @"tu", @"il", @"nous", @"vous", @"ils" ];
    NSArray * auxiliaryPasseComposeConjugated = @[ @"ai ", @"as ", @"a ", @"avons ", @"avez ", @"ont ", @"suis ", @"es ", @"est ", @"sommes ", @"êtes ", @"sont " ];
    
    NSString * (^GetConjugatedStrippedOfAuxliary)(NSString*, NSArray*)= ^ NSString *(NSString * verb, NSArray * auxiliaryVerbs) {
        NSString * result = verb;
        for( NSString * aux in auxiliaryVerbs ) {
            NSRange found = [verb rangeOfString:aux];
            if( found.location != NSNotFound ) {
                result = [verb substringFromIndex:NSMaxRange(found)];
            }
        }
        return result;
    };
    
    void (^TestPersons)(NSString*, Conjugator_Tense, ConjugatorOption, NSDictionary*) = ^(NSString * verb, Conjugator_Tense mode, ConjugatorOption option, NSDictionary * tenseDictionary){
        for( NSInteger i = 0; i < 6; i++ ) {
            Conjugator_Person person = (Conjugator_Person)Conjugator_Je + i;
            NSString * personString = personsToTest[i];
            
            NSString * conjugatedByModule = [_conjugator conjugateVerb:verb type:person mode:mode options:option];
            NSString * conjugatedByScrapper = tenseDictionary[personString];
            
            if( !(option & ConjugatorOption_IncludeAxuliaryVerb) ) {
                conjugatedByScrapper = GetConjugatedStrippedOfAuxliary(conjugatedByScrapper, auxiliaryPasseComposeConjugated);
            }
            
            if( [conjugatedByScrapper rangeOfString:@"/"].location != NSNotFound ) {
                BOOL atLeastOneIsCorrect = NO;
                
                NSArray * components = [conjugatedByScrapper componentsSeparatedByString:@"/"];
                for( NSString * conjugatedByScrapper in components ) {
                    if( atLeastOneIsCorrect ) {
                        break;
                    }
                    if( [conjugatedByModule isEqualToString:conjugatedByScrapper] ) {
                        atLeastOneIsCorrect = YES;
                    }
                    else {
                        NSLog(@"Wrong conjugator result for verb: %@, person: %@ (is=%@,shouldBe=%@", verb, personString, conjugatedByModule, conjugatedByScrapper);
                    }
                };
                
                XCTAssertTrue(atLeastOneIsCorrect, @"Wrong conjugation. Check logs.");
            }
            else {
                if( ![conjugatedByModule isEqualToString:conjugatedByScrapper] ) {
                    NSLog(@"Wrong conjugator result for verb: %@, person: %@ (is=%@,shouldBe=%@", verb, personString, conjugatedByModule, conjugatedByScrapper);
                }
                XCTAssertTrue([conjugatedByModule isEqualToString:conjugatedByScrapper], @"Verb `%@' conjugation error.", verb);
            }
        }
    };
    
    void (^TestVerb)(NSString*) = ^(NSString * aVerb) {
        NSData *data = [aVerb dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *verbWithoutAccents = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        XCTAssertNotNil(verbWithoutAccents, @"Verb must exist");
        
        NSString * conjugatedVerbPath = [conjugatedVerbsBundle pathForResource:verbWithoutAccents ofType:@"json"];
        XCTAssertNotNil(verbWithoutAccents, @"Conjugated verb must exist in the bundle");
        
        NSData * jsonData = [[NSData alloc] initWithContentsOfFile:conjugatedVerbPath];
        XCTAssertNotNil(jsonData, @"JSON data must exist");
        
        if( jsonData ) {
            NSError * error;
            NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
            XCTAssertNotNil(jsonDictionary, @"JSON dictionary must exist for verb: %@", aVerb);
            
            NSDictionary * tensePresent = jsonDictionary[@"present"];
            TestPersons(aVerb, ConjugatorTense_Present, 0, tensePresent);
            
            NSDictionary * tensePasseCompose = jsonDictionary[@"passeCompose"];
            TestPersons(aVerb, ConjugatorTense_PasseCompose, 0, tensePasseCompose);
            TestPersons(aVerb, ConjugatorTense_PasseCompose, ConjugatorOption_IncludeAxuliaryVerb, tensePasseCompose);
        }
    };

#if 0
    TestVerb(@"avoir");
//    TestVerb(@"mener");
//    TestVerb(@"esseyer");
#else
    for( NSString * aVerb in simpleVerbs ) {
        if( [aVerb isEqualToString:@"falloir"] ) {
            continue;
        }
        TestVerb(aVerb);
    }
#endif
}

@end


//
//  ConjugatorSharedLibraryTests.m
//  ConjugatorSharedLibraryTests
//
//  Created by Krzysiek on 14/12/15.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <ConjugatorSwiftLibrary/ConjugatorSwiftLibrary-Swift.h>

@interface Conjugator_Tests : XCTestCase
@property (nonatomic, strong) Conjugator * swiftConjugator;
@end

@implementation Conjugator_Tests

- (void)setUp
{
    [super setUp];
//    self.conjugator = [[FRConjugatorController alloc] init];
    self.swiftConjugator = [[Conjugator alloc] init];
}

- (void)tearDown;
{
    [super tearDown];
}

- (void)testRulesParse;
{
//    XCTAssertNotNil([_conjugator prototypeRules], @"No rules parsed");
//    XCTAssertTrue([_conjugator prototypeRules].count > 0, @"Too few rules!");
}

- (void)testSimpleConjugation;
{
//    NSString * result = [_conjugator conjugateVerb:@"être" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0];
//    XCTAssertNotNil(result, @"Must have a result");
//    XCTAssertTrue([result isEqualToString:@"suis"], @"Wrong conjugation returned");
//    
//    XCTAssertTrue([[_conjugator conjugateVerb:@"mener" type:FRConjugator_Tu mode:FRConjugatorTense_Present options:0] isEqualToString:@"mènes"], @"Wrong conjugation result");
//    
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Tu mode:FRConjugatorTense_Present options:0] isEqualToString:@"es"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Il_Elle mode:FRConjugatorTense_Present options:0] isEqualToString:@"est"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Nous mode:FRConjugatorTense_Present options:0] isEqualToString:@"sommes"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Vous mode:FRConjugatorTense_Present options:0] isEqualToString:@"êtes"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Ils_Elles mode:FRConjugatorTense_Present options:0] isEqualToString:@"sont"], @"Wrong conjugation result");
//    
//    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:FRConjugator_Je mode:FRConjugatorTense_Imparfait options:0] isEqualToString:@"étais"], @"Wrong conjugation result");
//    
//    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"soumets"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:FRConjugator_Je mode:FRConjugatorTense_PasseCompose options:0] isEqualToString:@"soumis"], @"Wrong conjugation result");
//    
//    XCTAssertTrue([[_conjugator conjugateVerb:@"permettre" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"permets"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"servir" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"sers"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"sais"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"chercher" type:FRConjugator_Nous mode:FRConjugatorTense_Present options:0] isEqualToString:@"cherchons"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"sais"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"concerner" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"concerne"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"consolider" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"consolide"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"écrire" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"écris"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"appelle"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:FRConjugator_Je mode:FRConjugatorTense_PasseCompose options:0] isEqualToString:@"appelé"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"jeter" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"jette"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"perdre" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"perds"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"relever" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"relève"], @"Wrong conjugation result");
//
//    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0] isEqualToString:@"considère"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:FRConjugator_Je mode:FRConjugatorTense_Imparfait options:0] isEqualToString:@"considérais"], @"Wrong conjugation result");
//    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:FRConjugator_Je mode:FRConjugatorTense_PasseCompose options:0] isEqualToString:@"considéré"], @"Wrong conjugation result");
//    
    // only the third person; so far doesn't work; TODO
    //XCTAssertTrue([[_conjugator conjugateVerb:@"falloir" type:FRConjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sers"], @"Wrong conjugation result");
}

- (void)testParticipePasse;
{
//    NSString * result = [_conjugator conjugateVerb:@"être" type:FRConjugator_Je mode:FRConjugatorTense_PasseCompose options:0];
//    XCTAssertNotNil(result, @"Must have a result");
//    XCTAssertTrue([result isEqualToString:@"été"], @"Wrong conjugation returned");
}

- (void)testSpeed;
{
//    __block NSString * result = Nil;
//    [self measureBlock:^{
//        result = [_conjugator conjugateVerb:@"être" type:FRConjugator_Je mode:FRConjugatorTense_Present options:0];
//    }];
}

- (void)testVerbs;
{
//    NSBundle * testBundle = [NSBundle bundleForClass:[self class]];
//    NSString * conjugatedVerbsBundlePath = [testBundle pathForResource:@"ConjugatedVerbs" ofType:Nil];
//    XCTAssertNotNil(conjugatedVerbsBundlePath, @"Path must exist");
//    
//    NSBundle * conjugatedVerbsBundle = [[NSBundle alloc] initWithPath:conjugatedVerbsBundlePath];
//    XCTAssertNotNil(conjugatedVerbsBundle, @"Bundle must exist");
//    
//    NSDictionary * verbsDictionary = [[NSDictionary alloc] initWithContentsOfFile:[conjugatedVerbsBundle pathForResource:@"verbs" ofType:@"plist"]];
//    XCTAssertNotNil(verbsDictionary, @"NSDictionary must exist");
//    
//    NSArray * simpleVerbs = verbsDictionary[@"beginner"];
//    XCTAssertNotNil(verbsDictionary, @"Simple verb array must exist");
//    
//    NSArray * personsToTest = @[ @"je", @"tu", @"il", @"nous", @"vous", @"ils" ];
//    NSArray * auxiliaryPasseComposeConjugated = @[ @"ai ", @"as ", @"a ", @"avons ", @"avez ", @"ont ", @"suis ", @"es ", @"est ", @"sommes ", @"êtes ", @"sont " ];
//    
//    NSString * (^GetConjugatedStrippedOfAuxliary)(NSString*, NSArray*)= ^ NSString *(NSString * verb, NSArray * auxiliaryVerbs) {
//        NSString * result = verb;
//        for( NSString * aux in auxiliaryVerbs ) {
//            NSRange found = [verb rangeOfString:aux];
//            if( found.location == 0 ) {
//                result = [verb substringFromIndex:NSMaxRange(found)];
//            }
//        }
//        return result;
//    };
//    
//    void (^TestPersons)(NSString*, FRConjugator_Tense, FRConjugator_Option, NSDictionary*) = ^(NSString * verb, FRConjugator_Tense mode, FRConjugator_Option option, NSDictionary * tenseDictionary){
//        for( NSInteger i = 0; i < 6; i++ ) {
//            FRConjugator_Person person = (FRConjugator_Person)FRConjugator_Je + i;
//            NSString * personString = personsToTest[i];
//            
//            NSString * conjugatedByModule = [_conjugator conjugateVerb:verb type:person mode:mode options:option];
//            NSString * conjugatedByScrapper = tenseDictionary[personString];
//            
//            if( !(option & FRConjugatorOption_IncludeAxuliaryVerb) ) {
//                conjugatedByScrapper = GetConjugatedStrippedOfAuxliary(conjugatedByScrapper, auxiliaryPasseComposeConjugated);
//            }
//            
//            if( [verb isEqualToString:@"falloir"] && !conjugatedByScrapper && !conjugatedByModule ) {
//                // ok
//            }
//            else if( [conjugatedByScrapper rangeOfString:@"/"].location != NSNotFound ) {
//                BOOL atLeastOneIsCorrect = NO;
//                
//                NSArray * components = [conjugatedByScrapper componentsSeparatedByString:@"/"];
//                for( NSString * conjugatedByScrapper in components ) {
//                    if( atLeastOneIsCorrect ) {
//                        break;
//                    }
//                    if( [conjugatedByModule isEqualToString:conjugatedByScrapper] ) {
//                        atLeastOneIsCorrect = YES;
//                    }
//                    else {
//                        NSLog(@"Wrong conjugator result for verb: %@, person: %@ (is=%@,shouldBe=%@", verb, personString, conjugatedByModule, conjugatedByScrapper);
//                    }
//                };
//                
//                XCTAssertTrue(atLeastOneIsCorrect, @"Wrong conjugation. Check logs.");
//            }
//            else {
//                if( ![conjugatedByModule isEqualToString:conjugatedByScrapper] ) {
//                    NSLog(@"Wrong conjugator result for verb: %@, person: %@ (is=%@,shouldBe=%@", verb, personString, conjugatedByModule, conjugatedByScrapper);
//                }
//                XCTAssertTrue([conjugatedByModule isEqualToString:conjugatedByScrapper], @"Verb `%@' conjugation error.", verb);
//            }
//        }
//    };
//    
//    void (^TestVerb)(NSString*) = ^(NSString * aVerb) {
//        NSData *data = [aVerb dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *verbWithoutAccents = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
//        XCTAssertNotNil(verbWithoutAccents, @"Verb must exist");
//        
//        NSString * conjugatedVerbPath = [conjugatedVerbsBundle pathForResource:verbWithoutAccents ofType:@"json"];
//        XCTAssertNotNil(verbWithoutAccents, @"Conjugated verb must exist in the bundle");
//        
//        NSData * jsonData = [[NSData alloc] initWithContentsOfFile:conjugatedVerbPath];
//        XCTAssertNotNil(jsonData, @"JSON data must exist");
//        
//        if( jsonData ) {
//            NSError * error;
//            NSDictionary * jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//            XCTAssertNotNil(jsonDictionary, @"JSON dictionary must exist for verb: %@", aVerb);
//            
//            NSDictionary * tensePresent = jsonDictionary[@"present"];
//            TestPersons(aVerb, FRConjugatorTense_Present, 0, tensePresent);
//            
//            NSDictionary * tensePasseCompose = jsonDictionary[@"passeCompose"];
//            TestPersons(aVerb, FRConjugatorTense_PasseCompose, 0, tensePasseCompose);
//            TestPersons(aVerb, FRConjugatorTense_PasseCompose, FRConjugatorOption_IncludeAxuliaryVerb, tensePasseCompose);
//
//            NSDictionary * tenseImparfait = jsonDictionary[@"imparfait"];
//            TestPersons(aVerb, FRConjugatorTense_Imparfait, 0, tenseImparfait);
//        }
//    };
//
//#if 0
//    TestVerb(@"falloir");
////    TestVerb(@"appeler");
////    TestVerb(@"avoir");
////    TestVerb(@"mener");
////    TestVerb(@"esseyer");
//#else
//    for( NSString * aVerb in simpleVerbs ) {
//        if( [aVerb isEqualToString:@"falloir"] ) {
//            continue;
//        }
//        TestVerb(aVerb);
//    }
//#endif
}

- (void)testSwift {
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
            if( found.location == 0 ) {
                result = [verb substringFromIndex:NSMaxRange(found)];
            }
        }
        return result;
    };
    
    NSArray<ConjugatorPerson *> * persons = [self.swiftConjugator getConjugatorPersons];
    NSArray<ConjugatorTense *> * tenses = [self.swiftConjugator getConjugatorTenses];
    
    void (^TestPersons)(NSString*, ConjugatorTense*, BOOL, NSDictionary*) = ^(NSString * verb, ConjugatorTense * tense, BOOL auxVerb, NSDictionary * tenseDictionary){
        for( NSInteger i = 0; i < 6; i++ ) {
            ConjugatorPerson * personObject = persons[i];
            NSString * personString = personsToTest[i];
            
            NSString * conjugatedByModule = [self.swiftConjugator conjugateWithVerb:verb withPerson:personObject withTense:tense includeAuxVerbs:auxVerb]; //[_conjugator conjugateVerb:verb type:person mode:mode options:option];
            NSString * conjugatedByScrapper = tenseDictionary[personString];
            
            if( !auxVerb ) {
                conjugatedByScrapper = GetConjugatedStrippedOfAuxliary(conjugatedByScrapper, auxiliaryPasseComposeConjugated);
            }
            
            if( [verb isEqualToString:@"falloir"] && !conjugatedByScrapper && !conjugatedByModule ) {
                // ok
            }
            else if( [conjugatedByScrapper rangeOfString:@"/"].location != NSNotFound ) {
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
    
    for( NSString * aVerb in simpleVerbs ) {
        if( [aVerb isEqualToString:@"falloir"] ) {
            continue;
        }

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
            TestPersons(aVerb, tenses[0], NO, tensePresent);

            NSDictionary * tensePasseCompose = jsonDictionary[@"passeCompose"];
            TestPersons(aVerb, tenses[1], NO, tensePasseCompose);
            TestPersons(aVerb, tenses[1], YES, tensePasseCompose);
            
            NSDictionary * tenseImparfait = jsonDictionary[@"imparfait"];
            TestPersons(aVerb, tenses[2], NO, tenseImparfait);
        }
    }
}

@end


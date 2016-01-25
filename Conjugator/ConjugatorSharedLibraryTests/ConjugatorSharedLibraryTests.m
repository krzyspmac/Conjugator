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
    NSString * result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorMode_Present];
    XCTAssertNotNil(result, @"Must have a result");
    XCTAssertTrue([result isEqualToString:@"suis"], @"Wrong conjugation returned");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Tu mode:ConjugatorMode_Present] isEqualToString:@"es"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Il_Elle mode:ConjugatorMode_Present] isEqualToString:@"est"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Nous mode:ConjugatorMode_Present] isEqualToString:@"sommes"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Vous mode:ConjugatorMode_Present] isEqualToString:@"êtes"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorMode_Present] isEqualToString:@"sont"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorMode_Imparfait] isEqualToString:@"étais"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"soumets"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"soumettre" type:Conjugator_Je mode:ConjugatorMode_PPasse] isEqualToString:@"soumis"], @"Wrong conjugation result");
    
    XCTAssertTrue([[_conjugator conjugateVerb:@"permettre" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"permets"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"servir" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sers"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"chercher" type:Conjugator_Nous mode:ConjugatorMode_Present] isEqualToString:@"cherchons"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"savoir" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"concerner" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"concerne"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"consolider" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"consolide"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"écrire" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"écris"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"appelle"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"appeler" type:Conjugator_Je mode:ConjugatorMode_PPasse] isEqualToString:@"appelé"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"jeter" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"jette"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"perdre" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"perds"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"relever" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"relève"], @"Wrong conjugation result");

    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"considère"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorMode_Imparfait] isEqualToString:@"considérais"], @"Wrong conjugation result");
    XCTAssertTrue([[_conjugator conjugateVerb:@"considérer" type:Conjugator_Je mode:ConjugatorMode_PPasse] isEqualToString:@"considéré"], @"Wrong conjugation result");
    
    // only the third person; so far doesn't work; TODO
    //XCTAssertTrue([[_conjugator conjugateVerb:@"falloir" type:Conjugator_Je mode:ConjugatorMode_Present] isEqualToString:@"sers"], @"Wrong conjugation result");
}

- (void)testParticipePasse;
{
    NSString * result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorMode_PPasse];
    XCTAssertNotNil(result, @"Must have a result");
    XCTAssertTrue([result isEqualToString:@"été"], @"Wrong conjugation returned");
}

- (void)testSpeed;
{
    __block NSString * result = Nil;
    [self measureBlock:^{
        result = [_conjugator conjugateVerb:@"être" type:Conjugator_Je mode:ConjugatorMode_Present];
    }];
}

@end


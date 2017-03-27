//
//  ViewController.m
//  SampleApplication
//
//  Created by Krzysiek on 14/12/15.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import "ViewController.h"
#import <ConjugatorSwiftLibrary/ConjugatorSwiftLibrary.h>
#import <ConjugatorSwiftLibrary/ConjugatorSwiftLibrary-Swift.h>

enum : NSUInteger {
    UITAG_Person_Sing_1st       = 1000,
    UITAG_Person_Sing_2nd       = 1001,
    UITAG_Person_Sing_3rd       = 1002,
    UITAG_Person_Plur_1st       = 1003,
    UITAG_Person_Plur_2nd       = 1004,
    UITAG_Person_Plur_3rd       = 1005,
};

@interface ViewController ()
@property (nonatomic, strong) NSArray * verbs;
@property (nonatomic, strong) Conjugator * conjugator;
@property (nonatomic, assign) NSInteger verbIndex;
@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if( self ) {
        self.conjugator = [[Conjugator alloc] init];
        
        NSString * verbsPath = [[NSBundle mainBundle] pathForResource:@"verbs" ofType:@"plist"];
        NSDictionary * verbsDictionary = [[NSDictionary alloc] initWithContentsOfFile:verbsPath];
        self.verbs = verbsDictionary[@"beginner"];
    }
    return self;
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
    self.verbIndex = 0;
}

- (void)setVerbIndex:(NSInteger)verbIndex;
{
    _verbIndex = verbIndex;
    if( verbIndex >= 0 && verbIndex < _verbs.count ) {
        NSString * verb = _verbs[verbIndex];
#if 0
        verb = @"jeter";
        verb = @"peser";
        verb = @"célébrer";
        verb = @"céder";
        verb = @"régler";
        verb = @"savoir";
        verb = @"avoir";
        verb = @"acheter";
        verb = @"permettre";
        verb =
        //    @"servir"
//        @"savoir"
//        @"chercher"
//        @"consolider"
//        @"appeler"
//        @"relever"
        @"considérer"
        ;
#endif
        
        NSArray<ConjugatorTense *> * tenses = [self.conjugator getConjugatorTenses];
        ConjugatorTense * tense = tenses[_selectedTense];
        BOOL auxOption = _useAuxiliaryVerbSwitch.on;
        
        _conjugatedVerbLabel.text = [NSString stringWithFormat:@"%@ %ld/%ld", verb, (long)_verbIndex+1, (long)_verbs.count];
        for( NSInteger tag = UITAG_Person_Sing_1st; tag <= UITAG_Person_Plur_3rd; tag++ ) {
            UILabel * label = (UILabel*)[self.view viewWithTag:tag];
            label.text = [_conjugator conjugateWithVerb:verb withPerson:[self getConjugatorPersonFromTag:tag] withTense:tense includeAuxVerbs:auxOption];
        }
    }
}

- (IBAction)showPrevious:(id)sender;
{
    if( _verbIndex > 0 ) {
        self.verbIndex--;
    }
}

- (IBAction)showNext:(id)sender;
{
    if( _verbIndex < _verbs.count ) {
        self.verbIndex++;
    }
}

- (void)update;
{
    [self setVerbIndex:_verbIndex];
}

- (IBAction)switchTense:(UISegmentedControl*)sender;
{
    self.selectedTense = (Tense)sender.selectedSegmentIndex;
    [self update];
}

- (IBAction)useAuxiliaryVerbSwitch:(id)sender;
{
    [self update];
}

- (ConjugatorPerson*)getConjugatorPersonFromTag:(NSInteger)tag;
{
    NSArray<ConjugatorPerson*> * persons = [self.conjugator getConjugatorPersons];
    ConjugatorPerson * person = persons[tag - UITAG_Person_Sing_1st];
    return person;
}

@end

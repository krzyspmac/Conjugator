//
//  ViewController.m
//  SampleApplication
//
//  Created by Krzysiek on 14/12/15.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import "ViewController.h"
#import <ConjugatorSharedLibrary/Conjugator.h>

@interface ViewController ()
@property (nonatomic, strong) Conjugator * conjugator;
@end

@implementation ViewController

- (id)initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder:aDecoder];
    if( self ) {
        self.conjugator = [[Conjugator alloc] init];
    }
    return self;
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
    _conjugatedVerbLabel.text = [_conjugator conjugateVerb:@"être" type:Conjugator_Ils_Elles mode:ConjugatorMode_Present];
}

@end

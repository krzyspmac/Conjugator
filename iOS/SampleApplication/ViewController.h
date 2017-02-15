//
//  ViewController.h
//  SampleApplication
//
//  Created by Krzysiek on 14/12/15.
//  Copyright (c) 2015 krzysp.net. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    Tense_Present,
    Tense_PasseCompose,
    Tense_Imparfait
} Tense;

@interface ViewController : UIViewController
@property (assign, nonatomic) Tense selectedTense;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tenseSegmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *useAuxiliaryVerbSwitch;
@property (weak, nonatomic) IBOutlet UILabel *conjugatedVerbLabel;
@end


//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Squirrel on 5/10/14.
//  Copyright (c) 2014 doveStep. All rights reserved.
//

#import "SettingsViewController.h"
#import "TipViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultSelectedTipPercentageSegmentControl;


- (IBAction)onTap:(id)sender;
- (void)storeDefaults;
- (void)updateSelectedTipPercentageFromSettings;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateSelectedTipPercentageFromSettings];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateSelectedTipPercentageFromSettings];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTap:(id)sender {
    [self storeDefaults];
}

- (void)storeDefaults {
    NSInteger selectedSegmentIndex = self.defaultSelectedTipPercentageSegmentControl.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:selectedSegmentIndex forKey:@"defaultSelectedTipPercentage"];
    [defaults synchronize];
}

- (void)updateSelectedTipPercentageFromSettings {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultSelectedTipercentage = [defaults integerForKey:@"defaultSelectedTipPercentage"];
    [self.defaultSelectedTipPercentageSegmentControl setSelectedSegmentIndex:defaultSelectedTipercentage];
}

@end

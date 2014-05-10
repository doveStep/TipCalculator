//
//  TipViewController.m
//  TipCalculator
//
//  Created by Squirrel on 5/10/14.
//  Copyright (c) 2014 doveStep. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountUIField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountUIField;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountUIField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegments;

- (IBAction)tapOut:(id)sender;
- (void)updateValues;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateValues];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapOut:(id)sender {
    [self.view endEditing:YES]; //sends keyboard away
    [self updateValues];
}

- (void)updateValues {
    float billValue = [self.billAmountUIField.text floatValue];
    
    NSArray *tipPercentages = @[@(0.1), @(0.15), @(0.2)];
    float selectedPercentage = [tipPercentages[self.tipPercentageSegments.selectedSegmentIndex] floatValue];
    
    float tipValue = billValue * selectedPercentage;
    float totalValue = billValue + tipValue;
    
    self.tipAmountUIField.text = [NSString stringWithFormat:@"$%.2f", tipValue];
    self.totalAmountUIField.text = [NSString stringWithFormat:@"$%.2f", totalValue];
}
@end

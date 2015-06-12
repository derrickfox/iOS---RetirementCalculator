//
//  ViewController.h
//  RetirementCalc
//
//  Created by Derrick Fox on 1/15/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *savingsText;
@property (weak, nonatomic) IBOutlet UITextField *monthSpendingText;
@property (weak, nonatomic) IBOutlet UILabel *dateText;
@property (weak, nonatomic) IBOutlet UILabel *ageText;

- (IBAction)goButton:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end


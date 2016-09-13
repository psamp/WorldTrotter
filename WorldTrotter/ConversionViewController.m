//
//  ViewController.m
//  WorldTrotter
//
//  Created by Princess Sampson on 9/12/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ConversionViewController.h"

@interface ConversionViewController () <UITextFieldDelegate>
@property(nonatomic) IBOutlet UILabel *celsiusLabel;
@property (nonatomic) IBOutlet UITextField *fahrenheitField;
@property(nonatomic) double fahrenheitValue;
@property(nonatomic) double celsiusValue;


@end

@implementation ConversionViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hi from Conversion! View all loaded.");
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    BOOL rtn = YES;
    
    NSRange existingRange = [textField.text rangeOfString:@"."];
    BOOL hasExistingDecimalSeperator = (existingRange.location != NSNotFound);
    
    NSRange newRange = [string rangeOfString:@"."];
    BOOL wantsNewDecimalSeperator = (newRange.location != NSNotFound);
    
    if(hasExistingDecimalSeperator && wantsNewDecimalSeperator) {
        rtn = NO;
    }
    
    return rtn;
}

- (IBAction) fahrenheitFieldEditingChanged:(UITextField*)textField {
    double temp = textField.text.doubleValue;
    self.fahrenheitValue = temp;
    
    NSNumber *num = [self.numberFormatter numberFromString:textField.text];
    
    if(num != nil) {
        self.fahrenheitValue = num.doubleValue;
    } else {
        self.celsiusLabel.text = @"???";
    }
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.fahrenheitField resignFirstResponder];
}

- (void)updateCelsiusLabel {
    self.celsiusLabel.text = [self.numberFormatter stringFromNumber:@(self.celsiusValue)];
}

- (NSNumberFormatter*)numberFormatter {
    static NSNumberFormatter *formatter = nil;
    
    if(formatter == nil) {
        formatter = [NSNumberFormatter new];
        formatter.numberStyle = NSNumberFormatterDecimalStyle;
        formatter.minimumFractionDigits = 0;
        formatter.maximumFractionDigits = 1;
    }
    
    return formatter;
}

- (void)setFahrenheitValue:(double)fahrenheitValue {
    _fahrenheitValue = fahrenheitValue;
    [self updateCelsiusLabel];
}


- (void)setCelsiusValue:(double)celsiusValue {
    self.fahrenheitValue = celsiusValue * 9.0/5.0 + 32.0;
}

- (double)celsiusValue {
    return (self.fahrenheitValue - 32.0) * 5.0/9.0;
}
@end

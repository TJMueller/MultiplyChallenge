//
//  ViewController.m
//  MultiplyChallenge
//
//  Created by Timothy Mueller on 3/9/15.
//  Copyright (c) 2015 Timothy Mueller. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *multiplierLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerLabel;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UISegmentedControl *operatorSegmentControl;
@property (strong, nonatomic) IBOutlet UILabel *calculatorNumberLabel;

@end

@implementation ViewController

int selectedSegment = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider.value = 5;
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", (int)self.slider.value];
    self.calculatorNumberLabel.text = @"";

}

- (IBAction)onSegmentChangeClicked:(UISegmentedControl*)segment {
    selectedSegment = [segment selectedSegmentIndex];
    NSLog(@"%i", selectedSegment);

}


- (IBAction)onCalculateButtonPressed:(id)sender {
    int userEnteredNumber = [self.calculatorNumberLabel.text intValue];
    //NSLog(@"%i", userEnteredNumber);
    int userMultiplier = (int) self.slider.value;
    int calculatedResult = 0;
    if (selectedSegment == 0){
        calculatedResult = userEnteredNumber * userMultiplier;
    }
    else {
        calculatedResult = userEnteredNumber / userMultiplier;
    }



    self.answerLabel.text = [NSString stringWithFormat:@"%i", calculatedResult];
    if (calculatedResult >= 20) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }

    if (calculatedResult % 5 == 0 && calculatedResult % 3 == 0) {
        self.answerLabel.text = @"Fizz Buzz";
    } else if (calculatedResult % 5 == 0){
        self.answerLabel.text = @"Buzz";
    } else if (calculatedResult % 3 == 0){
        self.answerLabel.text = @"Fizz";
    }
    [self.view endEditing:YES];
}



- (IBAction)sliderAction:(id)sender {
    int sliderValue = (int) self.slider.value;
    self.multiplierLabel.text = [NSString stringWithFormat:@"%i", sliderValue];

}


- (IBAction)buttonNumber:(UIButton *)sender {

    //int buttonVariable = (int)sender.titleLabel.text;

    self.calculatorNumberLabel.text = [self.calculatorNumberLabel.text stringByAppendingString:sender.titleLabel.text ];


}


- (IBAction)onPressClearLabel:(id)sender {
    self.calculatorNumberLabel.text = @"";
}
- (IBAction)onPressBackspace:(id)sender {
    NSString *tempString = self.calculatorNumberLabel.text;
    NSString *tempStringTwo;
    tempStringTwo = [tempString substringToIndex:[tempString length] - 1];
    self.calculatorNumberLabel.text = tempStringTwo;
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

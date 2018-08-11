//
//  ViewController.m
//  BillSplitter
//
//  Created by Kyla  on 2018-08-11.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) IBOutlet UISlider *mySlider;


@property (weak, nonatomic) IBOutlet UIButton *myButton;

@property (weak, nonatomic) IBOutlet UILabel *myLabel;

@property (nonatomic, strong) NSArray *peopleSplittingBillArray;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //    CGRectCGRect frame  frame ==  CGRectMakeCGRectMak (0.0, 0.0, 200.0, 10.0);
    //
    //    // sliderAction will respond to the updated slider value
    //    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    //    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    //    // Add slider to view
    //
    //    [self.view addSubview:slider];
    
    ////////////Set minimum and maximum value of Slider
    self.mySlider.minimumValue = 2.0;
    self.mySlider.maximumValue = 8.0;
    self.mySlider.continuous = YES;
  ///////////set initial value
    self.mySlider.value = 4;
    
}



//Spend some time looking at the properties of these views in IB, and customize the appearances and options of them to your liking.
//
//Now you'll need to implement the actual calculation. Do this using the NSDecimalNumber class, in order to keep accuracy when dealing with currency. You will most likely find it handy to use an NSNumberFormatter object to create a number from the string in the text field, and to turn the number of the split amount back into text to display in the label.


////////setting up the slider with the min and max values i gave it
- (IBAction)sliderValueChanged:(UISlider *)sender {
    int sliderValue = (int)roundf(self.mySlider.value);
    self.myLabel.text = [NSString stringWithFormat:@"%d", sliderValue];
}

/////////calcutlation method
-(void)calculateBillAndUpdateLabels {
    int sliderValue = (int)roundf(self.mySlider.value);
    self.myLabel.text = [NSString stringWithFormat:@"%d", sliderValue];
   
    
    double billAmount = self.myTextField.text.doubleValue;
   
    double totalAmount = billAmount / sliderValue;
    
    self.myLabel.text = [NSString stringWithFormat:@"$%f", totalAmount];
  
   
    
}


- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"Button Pressed");
    [self calculateBillAndUpdateLabels];
}


//- (IBAction)tipButtonPressed:(UIButton *)sender {
//    NSLog(@"did tap button");
//    ////call the method on the button
//    [self calculateTipAndUpdateLabels];
//}

@end

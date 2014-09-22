//
//  TPEMathematicsViewController.m
//  Expirement
//
//  Created by Ryan Chase on 9/22/14.
//  Copyright (c) 2014 Mohammad. All rights reserved.
//

#import "TPEMathematicsViewController.h"

@interface TPEMathematicsViewController ()  <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *numberInput;//Provides numerical input
@property (weak, nonatomic) IBOutlet UILabel *label;//Provides Direction and displays the number
@property (nonatomic, strong) NSTimer *numberGenerator; //fires the number printer
@property (weak, nonatomic) IBOutlet UIButton *button; //fires the nstimer and stops it

@end

@implementation TPEMathematicsViewController
    static int array[10] ={1,3,0,4,0,7,0,0,0,0};//holds the ten-digit number



- (IBAction)print:(id)sender {
    if (!_numberGenerator) { //begins process if not begun
        if (_numberInput.text.length==10) {//checks for input size, else uses default value for array
            for (int i = 0; i<10; i++) {
                NSString *soo = [_numberInput.text substringWithRange:NSMakeRange(i, 1)];
                array[i] = [soo integerValue];//takes input and converts it to int, applies it to array
            }
 }
               _numberInput.text = nil;
        
        self.numberGenerator = [NSTimer scheduledTimerWithTimeInterval:1 //sends a message every segon
                                                     target:self selector:@selector(numberPrinter:) userInfo:nil repeats:YES];
        [_numberGenerator fire];
        [_button setTitle:@"Click to end" forState:UIControlStateNormal];//change button name
    }
    else {[_numberGenerator invalidate];   //Reset to Initial settings
        _numberGenerator = nil;
        [_button setTitle:@"Click to begin" forState:UIControlStateNormal];
    };
}

-(void)numberPrinter:(NSTimer *) time{
    int counter[10] = {0,0,0,0,0,0,0,0,0,0};//counts the number of values in the ten-digit number
    

    for (int i = 0; i<10; i++) {
        
        switch (array[i]) {//counts the number of values in the ten-digit number

            case 0:
                counter[0]++;
                break;
            case 1:
                counter[1]++;
                break;
            case 2:
                counter[2]++;
                break;
            case 3:
                counter[3]++;
                break;
            case 4:
                counter[4]++;
                break;
            case 5:
                counter[5]++;
                break;
            case 6:
                counter[6]++;
                break;
            case 7:
                counter[7]++;
                break;
            case 8:
                counter[8]++;
                break;
            case 9:
                counter[9]++;
                break;
                
        }
        
    }
    for (int i = 0; i<10; i++) {//sets the first digit to number of zeroes, etc...
        array[i]    = counter[i];
    }
    self.label.text = [NSString stringWithFormat:@"%i%i%i%i%i%i%i%i%i%i", array[0], array[1], array[2], array[3], array[4], array[5], array[6], array[7], array[8], array[9]]; //prints results

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [_numberInput resignFirstResponder];//removes number pad if background is touched
}





@end

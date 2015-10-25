//
//  ViewController.m
//  FISFonting-awesome-ios-0915
//
//  Created by Guang on 10/24/15.
//  Copyright © 2015 Guang. All rights reserved.
//

#import "ViewController.h"
#import <FontAwesomeKit/FAKFontAwesome.h>
#import "CWStatusBarNotification.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pressMePlzButton;
@property (weak, nonatomic) IBOutlet UIButton *bikeButton;
@property (nonatomic, assign) BOOL colorSwtich;

- (IBAction)pressMePlz:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FAKFontAwesome *heartIcon = [FAKFontAwesome heartIconWithSize:95];
    NSMutableAttributedString *iConString = [[heartIcon attributedString] mutableCopy];
    [iConString appendAttributedString:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: [UIColor blueColor]}]];
    [self.pressMePlzButton setAttributedTitle:iConString forState:UIControlStateNormal];

}

-(UIColor *)switchColor{
    
    if (self.colorSwtich) {
        self.colorSwtich = false;
        return [UIColor redColor];
    } else{
        self.colorSwtich = true;
    return [UIColor blueColor];
    }
}

- (IBAction)pressMePlz:(id)sender {
    
    [self activeStatusBar];
    self.pressMePlzButton.tintColor = [self switchColor];
    FAKFontAwesome * bikeIcon = [FAKFontAwesome bicycleIconWithSize:90];
        NSMutableAttributedString * bikeString = [[bikeIcon attributedString] mutableCopy];
    [bikeString appendAttributedString:[[NSAttributedString alloc] initWithString:@"" attributes:@{NSForegroundColorAttributeName: [UIColor redColor]}]];
    [self.bikeButton setAttributedTitle:bikeString forState:UIControlStateNormal];
}


-(void)activeStatusBar{
    
    CWStatusBarNotification * notification = [CWStatusBarNotification new];
    //notification.notificationAnimationInStyle = CWNotificationAnimationStyleLeft;
    notification.notificationLabelBackgroundColor = [UIColor yellowColor];
    notification.notificationLabelTextColor = [UIColor whiteColor];
    
    [notification displayNotificationWithMessage:@"fancy the bike!" forDuration:0.5f];

    
    
}

@end

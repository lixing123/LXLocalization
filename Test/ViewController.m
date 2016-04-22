//
//  ViewController.m
//  Test
//
//  Created by 李 行 on 16/3/29.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "ViewController.h"
#import "LXLocalization.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 30, 200, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    [label LXL_SetTextWithKey:@"label"];
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 80, 200, 30);
    [self.view addSubview:button];
    [button LXL_SetTitleWithKey:@"button" forControlState:UIControlStateNormal];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 130, 200, 30)];
    [textField setTextColor:[UIColor blackColor]];
    [textField setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:textField];
    [textField LXL_SetPlaceholderWithKey:@"textField"];
    
    UIButton *changeLanguageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeLanguageButton.frame = CGRectMake(250, 30, 100, 30);
    [changeLanguageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:changeLanguageButton];
    [changeLanguageButton LXL_SetTitleWithKey:@"change" forControlState:UIControlStateNormal];
    [changeLanguageButton addTarget:self action:@selector(changeLanguage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeLanguage {
    if ([[[LXLocalization sharedInstance] localization] isEqualToString:@"zh-Hans"]) {
        [[LXLocalization sharedInstance] setLocalization:@"zh-Hant"];
    }else if ([[[LXLocalization sharedInstance] localization] isEqualToString:@"zh-Hant"]) {
        [[LXLocalization sharedInstance] setLocalization:@"en"];
    }else {
        [[LXLocalization sharedInstance] setLocalization:@"zh-Hans"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

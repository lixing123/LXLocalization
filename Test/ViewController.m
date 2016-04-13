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
    for (int i=0; i<100; i++) {
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 10+i*30, 200, 30)];
//        [label LXL_SetTitleWithKey:@"welcome"];
//        [self.view addSubview:label];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(50, 10+i+30, 200, 30);
        [button setTitle:@"welcome" forState:UIControlStateNormal];
        //[button LXL_SetTitleWithKey:@"welcome" forControlState:UIControlStateNormal];
    }
    
    UIButton *changeLanguageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    changeLanguageButton.frame = CGRectMake(50, 110, 200, 30);
    [self.view addSubview:changeLanguageButton];
    [changeLanguageButton setTitle:@"Change" forState:UIControlStateNormal];
    [changeLanguageButton addTarget:self action:@selector(changeLanguage) forControlEvents:UIControlEventTouchUpInside];
}

- (void)changeLanguage {
    [[LXLocalization sharedInstance] setLocalization:@"zh-Hant"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

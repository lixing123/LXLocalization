//
//  ViewController.m
//  Test
//
//  Created by 李 行 on 16/3/29.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+addLocalization.h"

#define LANG(key) \
[[MultiLang shareInstance] LocalizdString:(key)]

#define LANGA(stringArr) \
[[MultiLang shareInstance] LocalizdStringArr:(stringArr)]

#define GETFILENAME(fileName) \
[[MultiLang shareInstance] getPlistFileNameWithString:(fileName)]

#define setLang(langType) \
[[MultiLang shareInstance] setLang:(langType)]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    label.text = LANG(@"welcome");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

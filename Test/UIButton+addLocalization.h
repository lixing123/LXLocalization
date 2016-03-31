//
//  UIButton+addLocalization.h
//  Test
//
//  Created by 李 行 on 16/3/31.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LANG(key) \
[[MultiLang shareInstance] LocalizdString:(key)]

#define LANGA(stringArr) \
[[MultiLang shareInstance] LocalizdStringArr:(stringArr)]

#define GETFILENAME(fileName) \
[[MultiLang shareInstance] getPlistFileNameWithString:(fileName)]

#define setLang(langType) \
[[MultiLang shareInstance] setLang:(langType)]

@interface UIButton (addLocalization)

- (void)LXL_SetTitle:(NSString *)title forState:(UIControlState)controlState;

@end

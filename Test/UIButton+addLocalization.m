//
//  UIButton+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/3/31.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UIButton+addLocalization.h"

@implementation UIButton (addLocalization)

- (void)LXL_SetTitleKey:(NSString *)titleKey forState:(UIControlState)controlState {
    [self setTitle:LANG(titleKey) forState:controlState];
}

@end

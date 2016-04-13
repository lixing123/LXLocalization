//
//  UIView+addLocalization.h
//  Test
//
//  Created by 李 行 on 16/4/1.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "LXLocalization.h"

#define LocalizationKeyPath @"localization"

@interface UIView (addLocalization)

@property(nonatomic)NSString *titleKey;

@end

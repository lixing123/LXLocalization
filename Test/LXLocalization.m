//
//  LXLocalization.m
//  Test
//
//  Created by 李 行 on 16/4/1.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "LXLocalization.h"

@interface LXLocalization ()

@end

@implementation LXLocalization

static LXLocalization *instance;

+ (id)sharedInstance {
    if (!instance) {
        instance = [[LXLocalization alloc] init];
        instance.localization = @"zh-Hans";//默认为简体中文
    }
    return instance;
}

@end

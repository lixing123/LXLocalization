//
//  LXLocalization.h
//  Test
//
//  Created by 李 行 on 16/4/1.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UILabel+addLocalization.h"
#import "UIButton+addLocalization.h"

@interface LXLocalization : NSObject

@property(nonatomic)NSString *localization;

+ (id)sharedInstance;

@end

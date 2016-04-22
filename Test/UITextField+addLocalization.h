//
//  UITextField+addLocalization.h
//  Test
//
//  Created by 李 行 on 16/4/22.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (addLocalization)

- (void)LXL_SetTextWithKey:(NSString *)textKey;

- (void)LXL_SetPlaceholderWithKey:(NSString *)placeholderKey;

@end

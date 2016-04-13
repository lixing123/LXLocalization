//
//  UIView+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/4/1.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UIView+addLocalization.h"

@implementation UIView (addLocalization)

static const void *titleKey = &titleKey;

- (NSString *)titleKey {
    return objc_getAssociatedObject(self, titleKey);
}

- (void) setTitleKey:(NSString *)_titleKey {
    objc_setAssociatedObject(self, titleKey, _titleKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

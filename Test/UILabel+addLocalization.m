//
//  UIButton+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/3/31.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UILabel+addLocalization.h"
#import "LXLocalization.h"
#import <objc/runtime.h>

@interface UILabel ()

@property(nonatomic)NSString *titleKey;

@end

@implementation UILabel (addLocalization)

static const void *titleKey = &titleKey;

- (NSString *)titleKey {
    return objc_getAssociatedObject(self, titleKey);
}

- (void) setTitleKey:(NSString *)_titleKey {
    objc_setAssociatedObject(self, titleKey, _titleKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)LXL_SetTitleWithKey:(NSString *)titleKey {
    self.titleKey = titleKey;
    [self updateTitle];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsChanged) name:NSUserDefaultsDidChangeNotification object:nil];
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:@"localization"
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void) updateTitle {
    NSString *path = [[NSBundle mainBundle] pathForResource:[[LXLocalization sharedInstance] localization] ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *string = [languageBundle localizedStringForKey:self.titleKey value:@"" table:nil];
    self.text = string;
}

- (void)userDefaultsChanged {
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"localization"]) {
        [self updateTitle];
    }
}

@end

//
//  UIButton+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/3/31.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UILabel+addLocalization.h"
#import "LXLocalization.h"
#import "UIView+addLocalization.h"

@interface UILabel ()

@end

@implementation UILabel (addLocalization)

- (void)LXL_SetTitleWithKey:(NSString *)titleKey {
    self.titleKey = titleKey;
    [self updateTitle];
    
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:LocalizationKeyPath
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void) updateTitle {
    NSString *path = [[NSBundle mainBundle] pathForResource:[[LXLocalization sharedInstance] localization] ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *string = [languageBundle localizedStringForKey:self.titleKey value:@"" table:nil];
    self.text = string;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:LocalizationKeyPath]) {
        [self updateTitle];
    }
}

@end

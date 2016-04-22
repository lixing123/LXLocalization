//
//  UIButton+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/3/31.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UILabel+addLocalization.h"
#import "LXLocalization.h"
#import "NSObject+addLocalization.h"

@interface UILabel ()

@property(nonatomic)NSString *textKey;

@end

@implementation UILabel (addLocalization)

- (void)LXL_SetTextWithKey:(NSString *)textKey {
    self.textKey = textKey;
    [self updateTitle];
    
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:LocalizationKeyPath
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void) updateTitle {
    NSString *path = [[NSBundle mainBundle] pathForResource:[[LXLocalization sharedInstance] localization] ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *string = [languageBundle localizedStringForKey:self.textKey value:@"" table:nil];
    [self setText:string];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:LocalizationKeyPath]) {
        [self updateTitle];
    }
}

#pragma mark - add property textKey

static const void *textKey = &textKey;

- (NSString *)textKey {
    return objc_getAssociatedObject(self, textKey);
}

- (void) setTextKey:(NSString *)_titleKey {
    objc_setAssociatedObject(self, textKey, _titleKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

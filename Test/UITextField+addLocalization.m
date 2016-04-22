//
//  UITextField+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/4/22.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UITextField+addLocalization.h"
#import "LXLocalization.h"
#import "NSObject+addLocalization.h"

@interface UITextField()

@property(nonatomic)NSString *textKey;
@property(nonatomic)NSString *placeholderKey;

@end

@implementation UITextField (addLocalization)

- (void)LXL_SetTextWithKey:(NSString *)textKey {
    self.textKey = textKey;
    [self updateTitle];
    
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:LocalizationKeyPath
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void)LXL_SetPlaceholderWithKey:(NSString *)placeholderKey {
    self.placeholderKey = placeholderKey;
    [self updateTitle];
    
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:LocalizationKeyPath
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void) updateTitle {
    NSString *path = [[NSBundle mainBundle] pathForResource:[[LXLocalization sharedInstance] localization] ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *textString = [languageBundle localizedStringForKey:self.textKey value:@"" table:nil];
    [self setText:textString];
    
    NSString *placeholderString = [languageBundle localizedStringForKey:self.placeholderKey value:@"" table:nil];
    [self setText:placeholderString];
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

- (void) setTextKey:(NSString *)_textKey {
    objc_setAssociatedObject(self, textKey, _textKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - add property placeholderKey

static const void *placeholderKey = &placeholderKey;

- (NSString *)placeholderKey {
    return objc_getAssociatedObject(self, placeholderKey);
}

- (void) setPlaceholderKey:(NSString *)_placeholderKey {
    objc_setAssociatedObject(self, placeholderKey, _placeholderKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

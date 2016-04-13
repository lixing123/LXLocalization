//
//  UIButton+addLocalization.m
//  Test
//
//  Created by 李 行 on 16/4/1.
//  Copyright © 2016年 lixing123.com. All rights reserved.
//

#import "UIButton+addLocalization.h"
#import "UIView+addLocalization.h"
#import "LXLocalization.h"

@interface UIButton ()

//key->value: UIControlState->title
@property(nonatomic)NSMutableDictionary *dict;

@end

@implementation UIButton (addLocalization)

- (void)LXL_SetTitleWithKey:(NSString *)titleKey forControlState:(UIControlState)controlState {
    if (!self.dict) {
        self.dict = [[NSMutableDictionary alloc] init];
    }
    
    NSString *controlStateString = [NSString stringWithFormat:@"%lu",(unsigned long)@(controlState)];
    [self.dict setObject:titleKey forKey:controlStateString];
    
    [self updateTitleForAllControlState];
    
    [[LXLocalization sharedInstance] addObserver:self
                                      forKeyPath:LocalizationKeyPath
                                         options:NSKeyValueObservingOptionNew
                                         context:nil];
}

- (void) updateTitleForAllControlState {
    for (NSString *controlStateString in self.dict) {
        NSString *titleKey = self.dict[controlStateString];
        NSString *path = [[NSBundle mainBundle] pathForResource:[[LXLocalization sharedInstance] localization] ofType:@"lproj"];
        NSBundle *languageBundle = [NSBundle bundleWithPath:path];
        NSString *string = [languageBundle localizedStringForKey:titleKey value:@"" table:nil];
        UIControlState controlState = (UIControlState)controlStateString.intValue;
        [self setTitle:string forState:controlState];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:LocalizationKeyPath]) {
        [self updateTitleForAllControlState];
    }
}

static const void *dict = &dict;

- (NSMutableDictionary *)dict {
    return objc_getAssociatedObject(self, dict);
}

- (void) setDict:(NSMutableDictionary *)_dict {
    objc_setAssociatedObject(self, dict, _dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

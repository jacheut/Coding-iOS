//
//  ProjectTagLabel.m
//  Coding_iOS
//
//  Created by Ease on 15/7/21.
//  Copyright (c) 2015年 Coding. All rights reserved.
//

#import "ProjectTagLabel.h"

@interface ProjectTagLabel ()
@property (assign, nonatomic) CGFloat height, width_padding;

@end

@implementation ProjectTagLabel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
        self.layer.cornerRadius = 4;
        _height = 20;
        _width_padding = 10;
    }
    return self;
}

- (void)setCurTag:(ProjectTag *)curTag{
    _curTag = curTag;
    [self setup];
}

+ (instancetype)labelWithRag:(ProjectTag *)curTag font:(UIFont *)font height:(CGFloat)height widthPadding:(CGFloat)width_padding{
    ProjectTagLabel *label = [self new];
    
    label.font = font;
    label.height = height;
    label.width_padding = width_padding;
    label.curTag = curTag;
    
    return label;
}

- (void)setup{
    if (!self.curTag || self.curTag.name.length <= 0) {
        self.text = @"...";
        return;
    }
    UIColor *tagColor = self.curTag.color.length > 1? [UIColor colorWithHexString:[self.curTag.color stringByReplacingOccurrencesOfString:@"#" withString:@"0x"]]: [UIColor colorWithHexString:@"0x3bbd79"];
    self.layer.backgroundColor = tagColor.CGColor;
    self.textColor = [tagColor isDark]? [UIColor whiteColor]: [UIColor blackColor];
    
    CGFloat selfWidth = [self.curTag.name getWidthWithFont:self.font constrainedToSize:CGSizeMake(CGFLOAT_MAX, _height)] + _width_padding;
    [self setSize:CGSizeMake(selfWidth, _height)];
    self.text = self.curTag.name;
}

@end
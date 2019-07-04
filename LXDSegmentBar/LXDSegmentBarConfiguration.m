//
//  LXDSegmentBarConfiguration.m
//  LXDSegmentBar
//
//  Created by liaoxd on 2019/6/1.
//  Copyright © 2019 lxd. All rights reserved.
//

#import "LXDSegmentBarConfiguration.h"
@interface LXDSegmentBarConfiguration ()

/**
 背景颜色
 */
@property(nonatomic, strong, readwrite)UIColor *segmentBarBgColor;

/**
 默认颜色
 */
@property(nonatomic, strong, readwrite)UIColor *normalColor;


/**
 选中颜色
 */
@property(nonatomic, strong, readwrite)UIColor *selectedColor;


/**
 指示器颜色
 */
@property(nonatomic, strong, readwrite)UIColor *indicatorColour;

/**
 指示器宽度
 */
@property(nonatomic, assign, readwrite)CGFloat indicatorW;

/**
 指示器高度
 */
@property(nonatomic, assign, readwrite)CGFloat indicatorH;

/**
 指示器距离底部距离
 */
@property(nonatomic, assign, readwrite)CGFloat indicatorB;

/**
 默认字体
 */
@property(nonatomic, strong, readwrite)UIFont *normalFont;


/**
 选中字体
 */
@property(nonatomic, strong, readwrite)UIFont *selectedFont;

/**
 是否平均分配
 */
@property(nonatomic, assign, readwrite)BOOL isAverage;


/**
 item之间的距离
 */
@property(nonatomic, assign, readwrite)CGFloat segmentBarItemsSpace;


/**
 距离左右两边的间距
 */
@property(nonatomic, assign, readwrite)CGFloat segmentBarMargin;

/**
 内容向上偏移
 */
@property(nonatomic, assign, readwrite)CGFloat contentTopE;

@end;

@implementation LXDSegmentBarConfiguration

+ (id)defaultConfiguration {
    LXDSegmentBarConfiguration *configuration = [[LXDSegmentBarConfiguration alloc] init];
    configuration.segmentBarBgColor = UIColor.clearColor;
    configuration.normalColor = UIColor.blueColor;
    configuration.selectedColor = UIColor.redColor;
    configuration.indicatorColour = UIColor.redColor;
    configuration.indicatorW = 5;
    configuration.indicatorH = 2;
    configuration.indicatorB = 0;
    configuration.contentTopE = 0;
    configuration.normalFont = [UIFont systemFontOfSize:15];
    configuration.selectedFont = [UIFont systemFontOfSize:15];
    configuration.isAverage = YES;
    configuration.segmentBarMargin = 0;
    configuration.segmentBarItemsSpace = 20;
    return configuration;
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIColor * _Nonnull))backgroudColor {
    return ^(UIColor *color){
        self.segmentBarBgColor = color;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIColor * _Nonnull))itemNormalColor {
    return ^(UIColor *color){
        self.normalColor = color;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIColor * _Nonnull))itemSelectedColor {
    return ^(UIColor *color){
        self.selectedColor = color;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIColor * _Nonnull))indicatorColor {
    return ^(UIColor *color){
        self.indicatorColour = color;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))indicatorWidth {
    return ^(CGFloat width) {
        self.indicatorW = width;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))indicatorHeight {
    return ^(CGFloat height){
        self.indicatorH = height;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))indicatorBottom {
    return ^(CGFloat bottom){
        self.indicatorB = bottom;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIFont * _Nonnull))itemNormalFont {
    return ^(UIFont *font){
        self.normalFont = font;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(UIFont * _Nonnull))itemSelectedFont {
    return ^(UIFont *font){
        self.selectedFont = font;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(BOOL))itemsAverage {
    return ^(BOOL average) {
        self.isAverage = average;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))itemsSpace {
    return ^(CGFloat space) {
        self.segmentBarItemsSpace = space;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))margin {
    return ^(CGFloat margin) {
        self.segmentBarMargin = margin;
        return self;
    };
}

- (LXDSegmentBarConfiguration * _Nonnull (^)(CGFloat))contentTopEdge {
    return ^(CGFloat contentTopEdge) {
        self.contentTopE = contentTopEdge;
        return self;
    };
}

@end

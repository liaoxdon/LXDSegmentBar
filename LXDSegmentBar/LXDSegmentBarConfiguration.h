//
//  LXDSegmentBarConfiguration.h
//  LXDSegmentBar
//
//  Created by liaoxd on 2019/6/1.
//  Copyright © 2019 lxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 配置类
 */
@interface LXDSegmentBarConfiguration : NSObject


/**
 背景颜色
 */
@property(nonatomic, strong, readonly)UIColor *segmentBarBgColor;


/**
 默认颜色
 */
@property(nonatomic, strong, readonly)UIColor *normalColor;


/**
 选中颜色
 */
@property(nonatomic, strong, readonly)UIColor *selectedColor;


/**
 指示器颜色
 */
@property(nonatomic, strong, readonly)UIColor *indicatorColour;

/**
 指示器宽度
 */
@property(nonatomic, assign, readonly)CGFloat indicatorW;

/**
 指示器高度
 */
@property(nonatomic, assign, readonly)CGFloat indicatorH;

/**
 指示器距离底部距离
 */
@property(nonatomic, assign, readonly)CGFloat indicatorB;

/**
 默认字体
 */
@property(nonatomic, strong, readonly)UIFont *normalFont;


/**
 选中字体
 */
@property(nonatomic, strong, readonly)UIFont *selectedFont;

/**
 是否平均分配
 */
@property(nonatomic, assign, readonly)BOOL isAverage;


/**
 item之间的距离
 */
@property(nonatomic, assign, readonly)CGFloat segmentBarItemsSpace;


/**
 距离左右两边的间距
 */
@property(nonatomic, assign, readonly)CGFloat segmentBarMargin;


/**
 内容向上偏移
 */
@property(nonatomic, assign, readonly)CGFloat contentTopE;


/**
 配置背景颜色
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^backgroudColor)(UIColor *);

/**
 配置默认颜色
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemNormalColor)(UIColor *);

/**
 配置选中颜色
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemSelectedColor)(UIColor *);

/**
 配置指示器颜色
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^indicatorColor)(UIColor *);


/**
 配置指示器宽度
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^indicatorHeight)(CGFloat);

/**
 配置指示器高度
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^indicatorWidth)(CGFloat);

/**
 指示器距离底部距离
 */
@property(nonatomic, assign, readonly)LXDSegmentBarConfiguration* (^indicatorBottom)(CGFloat);


/**
 配置默认字体
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemNormalFont)(UIFont *);

/**
 配置选中字体
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemSelectedFont)(UIFont *);


/**
 配置是否平均
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemsAverage)(BOOL);


/**
 配置item之间的距离(只在非平均分配有效）
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^itemsSpace)(CGFloat);


/**
 配置距离左右两边的间距(只在非平均分配有效）
 */
@property(nonatomic, copy, readonly) LXDSegmentBarConfiguration* (^margin)(CGFloat);

/**
 配置内容向上偏移
 */
@property(nonatomic, assign, readonly) LXDSegmentBarConfiguration* (^contentTopEdge)(CGFloat);


+ (id)defaultConfiguration;


@end

NS_ASSUME_NONNULL_END

//
//  LXDSegmentBar.h
//  LXDSegmentBar
//
//  Created by liaoxd on 2019/6/1.
//  Copyright © 2019 lxd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LXDSegmentBarConfiguration.h"


NS_ASSUME_NONNULL_BEGIN


@class LXDSegmentBar;

@protocol LXDSegmentBarDelegate <NSObject>

- (void)segmentBar:(LXDSegmentBar *)segmentBar didSelectIndex:(NSInteger)index;

@end

@interface LXDSegmentBar : UIView

/**
 数据
 */
@property(nonatomic, strong)NSMutableArray *items;


/**
 选择的index
 */
@property(nonatomic, assign)NSInteger selectedIndex;

@property(nonatomic, assign)id <LXDSegmentBarDelegate>delegate;


- (void)updateConfiguration:(void (^)(LXDSegmentBarConfiguration *configuration))configuration;

@end

NS_ASSUME_NONNULL_END

//
//  LXDSegmentBar.m
//  LXDSegmentBar
//
//  Created by liaoxd on 2019/6/1.
//  Copyright © 2019 lxd. All rights reserved.
//

#import "LXDSegmentBar.h"

#import "UIView+LXDSegmentBar.h"

@interface LXDSegmentBar()

@property(nonatomic, strong)LXDSegmentBarConfiguration *configuration;


/**
 指示器
 */
@property(nonatomic, strong)UIView *indicatorView;


/**
 item按钮容器
 */
@property(nonatomic, strong)UIScrollView *contentScrollView;

/**
 item的数组
 */
@property(nonatomic, strong)NSMutableArray <UIButton *>*itemButtons;

@end

@implementation LXDSegmentBar

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.backgroundColor = self.configuration.segmentBarBgColor;
    }
    return self;
}

#pragma mark - 懒加载
- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height -self.configuration.indicatorH, self.configuration.indicatorW, self.configuration.indicatorH)];
        _indicatorView.backgroundColor = self.configuration.indicatorColour;
        [self.contentScrollView addSubview:_indicatorView];
    }
    return _indicatorView;
}

- (UIScrollView *)contentScrollView {
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] init];
        _contentScrollView.showsVerticalScrollIndicator = NO;
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_contentScrollView];
    }
    return _contentScrollView;
}


- (LXDSegmentBarConfiguration *)configuration {
    if (!_configuration) {
        _configuration = [LXDSegmentBarConfiguration defaultConfiguration];
    };
    return _configuration;
}

- (NSMutableArray<UIButton *> *)itemButtons {
    if (!_itemButtons) {
        _itemButtons = [[NSMutableArray alloc] init];
    }
    return _itemButtons;
}

#pragma mark -setter方法
- (void)setItems:(NSMutableArray *)items {
    _items = items;
    [self.itemButtons makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.itemButtons removeAllObjects];
    
    for (NSString *item in items) {
        UIButton *button = [UIButton new];
        button.tag = self.itemButtons.count;
        [button setTitle:item forState:UIControlStateNormal];
        [button setTitleColor:self.configuration.normalColor forState:UIControlStateNormal];
        [button setTitleColor:self.configuration.selectedColor forState:UIControlStateSelected];
        button.titleLabel.font = self.configuration.normalFont;
        [self.contentScrollView addSubview:button];
        [self.itemButtons addObject:button];
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (self.items.count == 0 || selectedIndex < 0 || selectedIndex > self.items.count - 1) {
        return;
    }
    
    UIButton *button = self.itemButtons[selectedIndex];
    [self buttonClick:button];
}

#pragma mark -点击事件
- (void)buttonClick:(UIButton *)button {
    UIButton *preSelectedButton = self.itemButtons[self.selectedIndex];
    preSelectedButton.titleLabel.font = self.configuration.normalFont;
    preSelectedButton.selected = NO;
    
    _selectedIndex = button.tag;
    button.selected = YES;
    button.titleLabel.font = self.configuration.selectedFont;
    
    
    if ([self.delegate respondsToSelector:@selector(segmentBar:didSelectIndex:)]) {
        [self.delegate segmentBar:self didSelectIndex:_selectedIndex];
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        self.indicatorView.width = self.configuration.indicatorW;
        self.indicatorView.centerX = button.centerX;
    }];
    
    CGFloat contentOffSetX = 0;
    //判断button的中心点在scrollview最右侧的距离是不是小于scrollview的宽度的一半
    if (self.contentScrollView.contentSize.width - button.centerX > self.contentScrollView.width / 2) {
        contentOffSetX = button.centerX - self.contentScrollView.width / 2;
        if (contentOffSetX < 0) {
            contentOffSetX = 0;
        }
    } else {
        contentOffSetX = self.contentScrollView.contentSize.width - self.contentScrollView.width;
    }
    [self.contentScrollView setContentOffset:CGPointMake(contentOffSetX, 0) animated:YES];
}

#pragma mark -
- (void)updateConfiguration:(void (^)(LXDSegmentBarConfiguration * _Nonnull))configuration {
    if (configuration) {
        configuration(self.configuration);
    }
    
    self.backgroundColor = self.configuration.segmentBarBgColor;
    self.indicatorView.backgroundColor = self.configuration.indicatorColour;
    
    for (UIButton *button in self.itemButtons) {
        [button setTitleColor:self.configuration.normalColor forState:UIControlStateNormal];
        [button setTitleColor:self.configuration.selectedColor forState:UIControlStateSelected];
        button.titleLabel.font = self.configuration.normalFont;
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.contentScrollView.frame = self.bounds;
    
    if (self.configuration.isAverage) {
        CGFloat lastX = 0;
        CGFloat buttonW = self.width / self.itemButtons.count;
        for (UIButton *button in self.itemButtons) {
            button.height = self.contentScrollView.height;
            button.width = buttonW;
            button.x = lastX;
            button.y = 0;
            lastX += button.width;
        }
        self.contentScrollView.contentSize = CGSizeMake(self.width, 0);
    } else {
        CGFloat lastX = self.configuration.segmentBarMargin - self.configuration.segmentBarItemsSpace /2;
        for (UIButton *button in self.itemButtons) {
            [button sizeToFit];
            button.height = self.contentScrollView.height;
            button.width = button.width + self.configuration.segmentBarItemsSpace;
            button.y = 0;
            button.x = lastX;
            lastX += button.width;
        }
        self.contentScrollView.contentSize = CGSizeMake(lastX + (self.configuration.segmentBarMargin - self.configuration.segmentBarItemsSpace /2), 0);
        
    }
    
    if (self.itemButtons.count == 0) {
        return;
    }
    
    UIButton *button = self.itemButtons[self.selectedIndex];
    self.indicatorView.width = self.configuration.indicatorW;
    self.indicatorView.height = self.configuration.indicatorH;
    self.indicatorView.y = self.height - self.indicatorView.height;
    self.indicatorView.centerX = button.centerX;
}


@end

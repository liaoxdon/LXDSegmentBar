//
//  ViewController.m
//  LXDSegmentBarDemo
//
//  Created by liaoxd on 2019/6/1.
//  Copyright © 2019 lxd. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LXDSegmentBar.h"
#import "LXDSegmentBar.h"
#import "LXDSegmentBarConfiguration.h"

@interface ViewController ()<LXDSegmentBarDelegate>
@property(nonatomic, strong) LXDSegmentBar *segmentBar;

@property(nonatomic, strong) UIButton *testButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
    
    self.segmentBar.delegate = self;
    self.segmentBar.items = [NSMutableArray arrayWithArray:@[@"关注", @"推荐", @"视频", @"小说", @"热点", @"科技", @"娱乐", @"NBA", @"体育", @"游戏", @"动漫", @"图片社", @"旅游", @"影视综", @"科技", @"搞笑"]];
    
    //    segmentBar.items = [NSMutableArray arrayWithArray:@[@"关注", @"推荐", @"视频", @"小说"]];
    
    [self.segmentBar updateConfiguration:^(LXDSegmentBarConfiguration * _Nonnull configuration) {
        configuration.backgroudColor(UIColor.yellowColor).itemSelectedFont([UIFont systemFontOfSize:18]).itemsAverage(NO).indicatorWidth(10).indicatorColor(UIColor.blackColor).indicatorHeight(1);
    }];
    
    [self.testButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initUI  {
    [self.view addSubview:self.segmentBar];
    [self.view addSubview:self.testButton];
}

- (LXDSegmentBar *)segmentBar{
    if (!_segmentBar) {
        _segmentBar = [[LXDSegmentBar alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 49)];
    }
    return _segmentBar;
}

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [UIButton new];
        [_testButton setTitle:@"测试" forState:UIControlStateNormal];
        _testButton.frame = CGRectMake(0, 200, 80, 50);
        _testButton.centerX = self.view.centerX;
        [_testButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    }
    return _testButton;
}

- (void)click {
    self.segmentBar.selectedIndex =  random() % 16;
}

- (void)segmentBar:(LXDSegmentBar *)segmentBar didSelectIndex:(NSInteger)index {
    NSLog(@"%zd", index);
}

@end

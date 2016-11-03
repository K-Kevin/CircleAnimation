//
//  ViewController.m
//  CircleAnimation
//
//  Created by likai on 2016/11/3.
//  Copyright © 2016年 likai. All rights reserved.
//

#import "ViewController.h"
#import "CircleView.h"
#import <UICountingLabel/UICountingLabel.h>
#import <UIView+Positioning/UIView+Positioning.h>

const CGFloat kCircleDiameter = 250.f;

@interface ViewController ()
{
    BOOL OnceInitcial;
}

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) CircleView *circleView;

@property (nonatomic, strong) UICountingLabel *markLabel;

@property (nonatomic, strong) UILabel *creditConditionLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *animateButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupCustomViews];
    
    [self addCircleView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!OnceInitcial) {
        [self animateAction];
        OnceInitcial = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupCustomViews {
    
    [self.view addSubview:self.containerView];
    [self.view addSubview:self.animateButton];
    
    [self.containerView addSubview:self.markLabel];
    [self.containerView addSubview:self.creditConditionLabel];
    [self.containerView addSubview:self.timeLabel];
    
}

- (void)addCircleView {
    CGFloat circleSize = kCircleDiameter;
    CGRect frame = CGRectMake(0.f, 0.f, circleSize, circleSize);
    self.circleView = [[CircleView alloc] initWithFrame:frame];
    self.circleView.strokeColor = [UIColor colorWithRed:254.f/255.0 green:182.f/255.0 blue:0/255.0 alpha:1];
    self.circleView.dottedColor = [UIColor groupTableViewBackgroundColor];
    self.circleView.center = self.containerView.center;
    [self.view addSubview:self.circleView];
    
    //进入页面先加载
    self.creditConditionLabel.text = @"信用良好";
    self.timeLabel.text = @"评估时间:2016.11.02.16";
    self.markLabel.text = @"0";
}

//开始动画
- (void)animateAction {
    
    NSInteger score = 92;
    
    //circle
    [self.circleView setStrokeEnd:(score/100.f) animated:YES];
    
    //label
    self.markLabel.method = UILabelCountingMethodLinear;
    self.markLabel.format = @"%d";
    [self.markLabel countFrom:0 to:score withDuration:1.5f];
    
}


#pragma mark - Getters and Setters

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] initWithFrame:CGRectMake((([UIScreen mainScreen].bounds.size.width) - kCircleDiameter)/2.f, 120.f, kCircleDiameter, kCircleDiameter)];
        _containerView.backgroundColor = [UIColor clearColor];
    }
    return _containerView;
}

- (UICountingLabel *)markLabel {
    if (!_markLabel) {
        _markLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(0.f, 80.f, kCircleDiameter, 60.f)];
        _markLabel.backgroundColor = [UIColor clearColor];
        _markLabel.textColor = [UIColor colorWithRed:254.f/255.0 green:182.f/255.0 blue:0/255.0 alpha:1];
        _markLabel.font = [UIFont systemFontOfSize:60.f];
        _markLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _markLabel;
}

- (UILabel *)creditConditionLabel {
    if (!_creditConditionLabel) {
        _creditConditionLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(0.f, self.markLabel.bottom + 13.f, kCircleDiameter, 25.f)];
        _creditConditionLabel.backgroundColor = [UIColor clearColor];
        _creditConditionLabel.textColor = [UIColor colorWithRed:254.f/255.0 green:182.f/255.0 blue:0/255.0 alpha:1];
        _creditConditionLabel.font = [UIFont systemFontOfSize:25.f];
        _creditConditionLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _creditConditionLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(0.f, self.creditConditionLabel.bottom + 6.f, kCircleDiameter, 12.f)];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.textColor = [UIColor colorWithRed:254.f/255.0 green:182.f/255.0 blue:0/255.0 alpha:1];
        _timeLabel.font = [UIFont systemFontOfSize:10.f];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}

- (UIButton *)animateButton {
    if (!_animateButton) {
        _animateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _animateButton.frame = CGRectMake(20.f, self.containerView.bottom + 50.f, ([UIScreen mainScreen].bounds.size.width) - 40.f, 40.f);
        [_animateButton setTitle:@"animate" forState:UIControlStateNormal];
        _animateButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_animateButton addTarget:self action:@selector(animateAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animateButton;
}

@end

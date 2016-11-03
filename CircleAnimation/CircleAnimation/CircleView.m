//
//  CircleView.m
//  CircleAnimation
//
//  Created by likai on 2016/11/3.
//  Copyright © 2016年 likai. All rights reserved.
//

#import "CircleView.h"

#define Radians(x)  (M_PI * (x) / 180.f)

const CGFloat kAnimateDuration = 1.5f;
const CGFloat kLineWidth = 15.f;

@interface CircleView()
{
    CGPoint CirCleCenter_;
    CGFloat CirCleRadius_;
}

@property(nonatomic) CAShapeLayer *circleBackLayer;
@property(nonatomic) CAShapeLayer *circleLayer;
- (void)addBackCircleLayer;
- (void)addCircleLayer;

@end

@implementation CircleView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(frame.size.width == frame.size.height, @"A circle must have the same height and width.");
        
        CirCleCenter_ = self.center;
        CirCleRadius_ = CGRectGetWidth(self.bounds)/2.f - kLineWidth/2.f;
        [self addBackCircleLayer];
    }
    return self;
}

#pragma mark - Instance Methods

- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated {
    
    [self.circleLayer removeAllAnimations];
    [self.circleLayer removeFromSuperlayer];
    
    [self addCircleLayer];
    
    CGFloat beginAngle = Radians(70.f + 55.f);
    CGFloat endAngle = Radians(70.f + 55.f + 290.f * strokeEnd);
    self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CirCleCenter_
                                                           radius:CirCleRadius_
                                                       startAngle:beginAngle
                                                         endAngle:endAngle
                                                        clockwise:YES].CGPath;
    if (animated) {
        CAKeyframeAnimation *strokeEndAnimation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
        strokeEndAnimation.values = @[@(0),@1];
        strokeEndAnimation.keyTimes = @[@0.f, @1.f];
        strokeEndAnimation.duration = kAnimateDuration;
        [self.circleLayer addAnimation:strokeEndAnimation forKey:nil];
    }
}

#pragma mark - Property Setters

- (void)setStrokeColor:(UIColor *)strokeColor {
//    self.circleLayer.strokeColor = strokeColor.CGColor;
    _strokeColor = strokeColor;
}

- (void)setDottedColor:(UIColor *)dottedColor {
    self.circleBackLayer.strokeColor = dottedColor.CGColor;
    _dottedColor = dottedColor;
}

#pragma mark - Private Instance methods

- (void)addBackCircleLayer {
    self.circleBackLayer = [CAShapeLayer layer];
    self.circleBackLayer.strokeColor = self.tintColor.CGColor;
    self.circleBackLayer.fillColor = nil;
    self.circleBackLayer.lineCap = kCALineCapRound;
    self.circleBackLayer.lineJoin = kCALineJoinRound;
    self.circleBackLayer.lineWidth = kLineWidth;
    self.circleBackLayer.contentsScale = [UIScreen mainScreen].scale;
    self.circleBackLayer.path = [UIBezierPath bezierPathWithArcCenter:CirCleCenter_
                                                               radius:CirCleRadius_
                                                           startAngle:Radians(70.f + 55.f)
                                                             endAngle:2.f * M_PI + Radians(55.f)
                                                            clockwise:YES].CGPath;
    [self.layer addSublayer:self.circleBackLayer];
}

- (void)addCircleLayer {
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.strokeColor = self.tintColor.CGColor;
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.lineJoin = kCALineJoinRound;
    self.circleLayer.lineWidth = kLineWidth;
    self.circleLayer.contentsScale = [UIScreen mainScreen].scale;
    self.circleLayer.strokeColor = _strokeColor.CGColor;

    [self.layer addSublayer:self.circleLayer];
}

@end

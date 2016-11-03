//
//  CircleView.h
//  CircleAnimation
//
//  Created by likai on 2016/11/3.
//  Copyright © 2016年 likai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

/**实部颜色*/
@property(nonatomic) UIColor *strokeColor;

/**虚部颜色*/
@property(nonatomic) UIColor *dottedColor;

/**设置百分比*/
- (void)setStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated;

@end

//
//  CircleProgressView.h
//  CircleProgressView
//
//  Created by mac on 2019/11/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CircleProgressView : UIView

/// 宽度
@property (nonatomic, assign) CGFloat lineWidth;
/// 进度背景颜色
@property (nonatomic, strong) UIColor * progressBackColor;
/// 进度条颜色
@property (nonatomic, strong) UIColor * progressColor;
/// 显示字体大小
@property (nonatomic, assign) NSInteger fontSize;

- (void)updateProgress:(CGFloat)progress;

- (void)updateProgress:(CGFloat)progress title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END

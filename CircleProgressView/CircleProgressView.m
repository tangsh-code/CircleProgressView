//
//  CircleProgressView.m
//  CircleProgressView
//
//  Created by mac on 2019/11/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CircleProgressView.h"

@interface CircleProgressView ()

@property (nonatomic, strong) UILabel * progressLabel;
@property (nonatomic, assign) CGFloat progress;

@end

@implementation CircleProgressView

- (CGFloat)lineWidth
{
    return 3;
}

- (NSInteger)fontSize
{
    return 20;
}

- (UIColor *)progressBackColor
{
    if (nil == _progressBackColor) {
        _progressBackColor = [UIColor grayColor];
    }
    
    return _progressBackColor;
}

- (UIColor *)progressColor
{
    if (nil == _progressColor) {
        _progressColor = [UIColor redColor];
    }
    
    return _progressColor;
}

- (UILabel *)progressLabel
{
    if (nil == _progressLabel) {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
        _progressLabel.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        _progressLabel.textColor = self.progressColor;
        _progressLabel.font = [UIFont systemFontOfSize:self.fontSize];
        _progressLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_progressLabel];
    }
    
    return _progressLabel;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
    NSLog(@"frame == %@", NSStringFromCGRect(self.frame));
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        NSLog(@"frame == %@", NSStringFromCGRect(frame));
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)updateProgress:(CGFloat)progress
{
    _progress = progress;
    // 显示百分比进度
    self.progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)floor(progress * 100)];
    [self setNeedsDisplay];
}

- (void)updateProgress:(CGFloat)progress title:(NSString *)title
{
    _progress = progress;
    self.progressLabel.text = title;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    //路径
    UIBezierPath *backgroundPath = [[UIBezierPath alloc] init];
    //线宽
    backgroundPath.lineWidth = self.lineWidth;
    //颜色
    [self.progressBackColor set];
    //拐角
    backgroundPath.lineCapStyle = kCGLineCapRound;
    backgroundPath.lineJoinStyle = kCGLineJoinRound;
    //半径
    CGFloat radius = (MIN(rect.size.width, rect.size.height) - self.lineWidth) * 0.5 * 0.8;
    
    // 画弧 （参数：中心、半径、起始角度（3点钟方向为0）、结束角度、是否顺时针）
    [backgroundPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2  clockwise:YES];
    //连线
    [backgroundPath stroke];

    //路径
    UIBezierPath * progressPath = [[UIBezierPath alloc] init];
    //线宽
    progressPath.lineWidth = self.lineWidth;
    //颜色
    [self.progressColor set];
    //拐角
    progressPath.lineCapStyle = kCGLineCapRound;
    progressPath.lineJoinStyle = kCGLineJoinRound;
    // 画弧 （参数：中心、半径、起始角度（3点钟方向为0）、结束角度、是否顺时针）
    [progressPath addArcWithCenter:(CGPoint){rect.size.width * 0.5, rect.size.height * 0.5} radius:radius startAngle:M_PI * 1.5 endAngle:M_PI * 1.5 + M_PI * 2 * _progress clockwise:YES];
    //连线
    [progressPath stroke];
}

@end

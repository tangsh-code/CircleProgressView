//
//  ViewController.m
//  CircleProgressView
//
//  Created by mac on 2019/11/16.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"
#import "CircleProgressView.h"

static const CGFloat MaxValue = 6;

@interface ViewController ()
{
    NSInteger currentValue;
}
@property (nonatomic, strong) CircleProgressView * circleView;
@property (nonatomic, strong) NSTimer * timer;
@property (weak, nonatomic) IBOutlet CircleProgressView *circleProgressView;

@end

@implementation ViewController

- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.circleView = [[CircleProgressView alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
//    self.circleProgressView.fontSize = 30;
//    [self.view addSubview:self.circleView];
    
    currentValue = MaxValue;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgressAction) userInfo:nil repeats:YES];
}

- (void)updateProgressAction
{
    NSLog(@"currentValue == %ld", currentValue);
    currentValue--;
    if (currentValue <= 0) {
        [self.timer invalidate];
        self.timer = nil;
    }
    /// 倒计时
    CGFloat progress = (CGFloat)currentValue/MaxValue;
    NSLog(@"progress = %f", progress);
    [self.circleView updateProgress:progress title:[NSString stringWithFormat:@"%ld", (long)currentValue]];
    
    [self.circleProgressView updateProgress:progress title:[NSString stringWithFormat:@"%ld", (long)currentValue]];
}

@end

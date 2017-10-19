//
//  ViewController.m
//  CustomLoadingAnimation
//
//  Created by neoby on 2017/10/19.
//  Copyright © 2017年 553559555. All rights reserved.
//

#import "ViewController.h"

#define screenWidth [UIScreen mainScreen].bounds.size.width / 2
#define DISMISSANIMATION @"purpleViewOneStageAnimationEnd"
#define DISMISSANIMATIONEND @"purpleViewTwoStageAnimationEnd"

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic,strong) UIView *purpleView;
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *greenView;
@property (nonatomic,strong) UIView *orangeView;
@property (nonatomic,strong) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _purpleView = [[UIView alloc] initWithFrame:CGRectMake(-20, 100, 20, 20)];
    _purpleView.backgroundColor = [UIColor purpleColor];
    _purpleView.layer.masksToBounds = YES;
    _purpleView.layer.cornerRadius = 10;
    [self.view addSubview:_purpleView];
    
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(-20, 100, 20, 20)];
    _blueView.backgroundColor = [UIColor blueColor];
    _blueView.layer.masksToBounds = YES;
    _blueView.layer.cornerRadius = 10;
    [self.view addSubview:_blueView];
    
    _greenView = [[UIView alloc] initWithFrame:CGRectMake(-20, 100, 20, 20)];
    _greenView.backgroundColor = [UIColor greenColor];
    _greenView.layer.masksToBounds = YES;
    _greenView.layer.cornerRadius = 10;
    [self.view addSubview:_greenView];
    
    _orangeView = [[UIView alloc] initWithFrame:CGRectMake(-20, 100, 20, 20)];
    _orangeView.backgroundColor = [UIColor orangeColor];
    _orangeView.layer.masksToBounds = YES;
    _orangeView.layer.cornerRadius = 10;
    [self.view addSubview:_orangeView];
    
    _redView = [[UIView alloc] initWithFrame:CGRectMake(-20, 100, 20, 20)];
    _redView.backgroundColor = [UIColor redColor];
    _redView.layer.masksToBounds = YES;
    _redView.layer.cornerRadius = 10;
    [self.view addSubview:_redView];
    //开始动画
    [self startOneStageAllAnimation];
}

- (void)startOneStageAllAnimation {
    [self performSelector:@selector(redViewOneStageAnimation) withObject:nil afterDelay:(0)];
    [self performSelector:@selector(orangeViewOneStageAnimation) withObject:nil afterDelay:(0.2)];
    [self performSelector:@selector(greenViewOneStageAnimation) withObject:nil afterDelay:(0.4)];
    [self performSelector:@selector(blueViewOneStageAnimation) withObject:nil afterDelay:(0.6)];
    [self performSelector:@selector(purpleViewOneStageAnimation) withObject:nil afterDelay:(0.8)];
}

- (void)startTwoStageAllAnimtion {
    [self performSelector:@selector(redViewTwoStageAnimation) withObject:nil afterDelay:(0)];
    [self performSelector:@selector(orangeViewTwoStageAnimation) withObject:nil afterDelay:(0.2)];
    [self performSelector:@selector(greenViewTwoStageAnimation) withObject:nil afterDelay:(0.4)];
    [self performSelector:@selector(blueViewTwoStageAnimation) withObject:nil afterDelay:(0.6)];
    [self performSelector:@selector(purpleViewTwoStageAnimation) withObject:nil afterDelay:(0.8)];
}

//动画结束后调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([_purpleView.layer animationForKey:DISMISSANIMATION]==anim) {
        [self startTwoStageAllAnimtion];
    }
    if ([_purpleView.layer animationForKey:DISMISSANIMATIONEND]==anim) {
        [_redView.layer removeAllAnimations];
        [_purpleView.layer removeAllAnimations];
        [_blueView.layer removeAllAnimations];
        [_greenView.layer removeAllAnimations];
        [_orangeView.layer removeAllAnimations];
        [self startOneStageAllAnimation];
    }
}

- (void)purpleViewOneStageAnimation {
    CABasicAnimation *purpleViewOneStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    purpleViewOneStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    purpleViewOneStageAnimation.duration = 1.5;
    purpleViewOneStageAnimation.delegate = self;
    purpleViewOneStageAnimation.toValue = @(screenWidth - 50);
    purpleViewOneStageAnimation.repeatCount = 1;
    purpleViewOneStageAnimation.removedOnCompletion = NO;
    purpleViewOneStageAnimation.fillMode = kCAFillModeForwards;
    [self.purpleView.layer addAnimation:purpleViewOneStageAnimation forKey:DISMISSANIMATION];
}

- (void)blueViewOneStageAnimation {
    CABasicAnimation *blueViewOneStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    blueViewOneStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    blueViewOneStageAnimation.duration = 1.5;
    blueViewOneStageAnimation.delegate = self;
    blueViewOneStageAnimation.toValue = @(screenWidth-25);
    blueViewOneStageAnimation.repeatCount = 1;
    blueViewOneStageAnimation.removedOnCompletion = NO;
    blueViewOneStageAnimation.fillMode = kCAFillModeForwards;
    [self.blueView.layer addAnimation:blueViewOneStageAnimation forKey:nil];
}

- (void)greenViewOneStageAnimation {
    CABasicAnimation *greenViewOneStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    greenViewOneStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    greenViewOneStageAnimation.duration = 1.5;
    greenViewOneStageAnimation.delegate = self;
    greenViewOneStageAnimation.toValue = @(screenWidth);
    greenViewOneStageAnimation.repeatCount = 1;
    greenViewOneStageAnimation.removedOnCompletion = NO;
    greenViewOneStageAnimation.fillMode = kCAFillModeForwards;
    [self.greenView.layer addAnimation:greenViewOneStageAnimation forKey:nil];
}

- (void)orangeViewOneStageAnimation {
    CABasicAnimation *orangeViewOneStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    orangeViewOneStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    orangeViewOneStageAnimation.duration = 1.5;
    orangeViewOneStageAnimation.delegate = self;
    orangeViewOneStageAnimation.toValue = @(screenWidth+25);
    orangeViewOneStageAnimation.repeatCount = 1;
    orangeViewOneStageAnimation.removedOnCompletion = NO;
    orangeViewOneStageAnimation.fillMode = kCAFillModeForwards;
    [self.orangeView.layer addAnimation:orangeViewOneStageAnimation forKey:nil];
}

- (void)redViewOneStageAnimation {
    CABasicAnimation *redViewOneStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    redViewOneStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    redViewOneStageAnimation.duration = 1.5;
    redViewOneStageAnimation.delegate = self;
    redViewOneStageAnimation.toValue = @(screenWidth+50);
    redViewOneStageAnimation.repeatCount = 1;
    redViewOneStageAnimation.removedOnCompletion = NO;
    redViewOneStageAnimation.fillMode = kCAFillModeForwards;
    [self.redView.layer addAnimation:redViewOneStageAnimation forKey:nil];
}

- (void)purpleViewTwoStageAnimation {
    CABasicAnimation *purpleViewTwoStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    purpleViewTwoStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    purpleViewTwoStageAnimation.duration = 1.5;
    purpleViewTwoStageAnimation.delegate = self;
    purpleViewTwoStageAnimation.toValue = @(screenWidth * 2 + 30);
    purpleViewTwoStageAnimation.repeatCount = 1;
    purpleViewTwoStageAnimation.removedOnCompletion = NO;
    purpleViewTwoStageAnimation.fillMode = kCAFillModeForwards;
    [self.purpleView.layer addAnimation:purpleViewTwoStageAnimation forKey:DISMISSANIMATIONEND];
}

- (void)blueViewTwoStageAnimation {
    CABasicAnimation *blueViewTwoStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    blueViewTwoStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    blueViewTwoStageAnimation.duration = 1.5;
    blueViewTwoStageAnimation.delegate = self;
    blueViewTwoStageAnimation.toValue = @(screenWidth * 2 + 30);
    blueViewTwoStageAnimation.repeatCount = 1;
    blueViewTwoStageAnimation.removedOnCompletion = NO;
    blueViewTwoStageAnimation.fillMode = kCAFillModeForwards;
    [self.blueView.layer addAnimation:blueViewTwoStageAnimation forKey:nil];
}

- (void)greenViewTwoStageAnimation {
    CABasicAnimation *greenViewTwoStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    greenViewTwoStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    greenViewTwoStageAnimation.duration = 1.5;
    greenViewTwoStageAnimation.delegate = self;
    greenViewTwoStageAnimation.toValue = @(screenWidth * 2 + 30);
    greenViewTwoStageAnimation.repeatCount = 1;
    greenViewTwoStageAnimation.removedOnCompletion = NO;
    greenViewTwoStageAnimation.fillMode = kCAFillModeForwards;
    [self.greenView.layer addAnimation:greenViewTwoStageAnimation forKey:nil];
}

- (void)orangeViewTwoStageAnimation {
    CABasicAnimation *orangeViewTwoStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    orangeViewTwoStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    orangeViewTwoStageAnimation.duration = 1.5;
    orangeViewTwoStageAnimation.delegate = self;
    orangeViewTwoStageAnimation.toValue = @(screenWidth * 2 + 30);
    orangeViewTwoStageAnimation.repeatCount = 1;
    orangeViewTwoStageAnimation.removedOnCompletion = NO;
    orangeViewTwoStageAnimation.fillMode = kCAFillModeForwards;
    [self.orangeView.layer addAnimation:orangeViewTwoStageAnimation forKey:nil];
}

- (void)redViewTwoStageAnimation {
    CABasicAnimation *redViewTwoStageAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    redViewTwoStageAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    redViewTwoStageAnimation.duration = 1.5;
    redViewTwoStageAnimation.delegate = self;
    redViewTwoStageAnimation.toValue = @(screenWidth * 2 + 30);
    redViewTwoStageAnimation.repeatCount = 1;
    redViewTwoStageAnimation.removedOnCompletion = NO;
    redViewTwoStageAnimation.fillMode = kCAFillModeForwards;
    [self.redView.layer addAnimation:redViewTwoStageAnimation forKey:nil];
}


@end


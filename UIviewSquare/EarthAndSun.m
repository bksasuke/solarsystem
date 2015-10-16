//
//  EarthAndSun.m
//  EarthAndSun
//
//  Created by student on 10/15/15.
//  Copyright © 2015 student. All rights reserved.
//

#import "EarthAndSun.h"

@implementation EarthAndSun
{
    NSTimer *timer, *timer2;
    UIImageView *sun;
    UIImageView *earth;
    UIImageView *moon;
    CGPoint sunCenter; //CoreGraphics Point
    CGPoint earthCenter; //
    CGFloat distanceEarthToSun;
    CGFloat distanceMoonToEarth;
    CGFloat angle;  //goc quay trai dat
    CGFloat angle2; //goc quay mat trang
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background1.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
    [self addSunAndEarth];
    [self addMoon];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.0167
                                              target:self
                                            selector:@selector(spinMoon)
                                            userInfo:nil
                                             repeats:true];
    
}
- (void)addSunAndEarth {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    sun = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.5-10, (mainViewSize.height )*0.5,60,57)];
    sun.animationImages= @[[UIImage imageNamed:@"sun1.png"],
                           [UIImage imageNamed:@"sun2.png"],
                           [UIImage imageNamed:@"sun3.png"],
                           [UIImage imageNamed:@"sun4.png"]];
    sun.animationRepeatCount =0;
    sun.animationDuration =1 ;
    [self.view addSubview:sun];
    [sun startAnimating];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    sunCenter = CGPointMake(self.view.bounds.size.width * 0.5, (self.view.bounds.size.height + statusNavigationBarHeight) * 0.5);
    distanceEarthToSun = self.view.bounds.size.width * 0.5 - 25.0;
    angle = 0.0;
    earth.center = [self computePositionOfEarch:angle];
    moon.center = [self computePositionOfMoon:angle2];
    [self.view addSubview:earth];
}
-(void)addMoon {
    moon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moon"]];
    distanceMoonToEarth = 30;
    angle2=0.0;
    moon.center = [self computePositionOfMoon:angle2];
    [self.view addSubview:moon];
}

- (CGPoint)computePositionOfEarch: (CGFloat) _angle {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle),
                       sunCenter.y + distanceEarthToSun * sin(angle));
}
- (CGPoint)computePositionOfMoon: (CGFloat) _angle2 {
    return CGPointMake(sunCenter.x + distanceEarthToSun * cos(angle) + distanceMoonToEarth*cos(angle2),
                       sunCenter.y + distanceEarthToSun * sin(angle) + distanceMoonToEarth*sin(angle2));
}
- (void) spinEarth {
    angle += 0.007;
    earth.center = [self computePositionOfEarch:angle];
}
- (void) spinMoon {
    angle2 += 0.02;
    moon
    .center = [self computePositionOfMoon:angle2];
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end

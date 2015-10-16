//
//  NestedSquare.m
//  UIviewSquare
//
//  Created by student on 10/2/15.
//  Copyright (c) 2015 student. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare

- (void)viewDidLoad {
    self.view.backgroundColor =[UIColor blackColor];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquares)
               withObject:nil
               afterDelay:2];
    
};
//draw all nested squares
-(void) drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin*2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGPoint center = CGPointMake(mainViewSize.width*.5, (mainViewSize.height + statusNavigationBarHeight)*.5);
    for (int i =0; i<10; i++) {
        UIView* square;
        if (i %2 ==0) {
            square =  [self drawSquareByWidth:recWidth
                                    andRotate:false
                                     atCenter:center];
        } else {
            square =  [self drawSquareByWidth:recWidth
                                    andRotate:true
                                     atCenter:center];
        }
        [self.view addSubview:square];
        recWidth =recWidth * sqrt(2)/2; // sqrt(2)/2
    }
}
- (UIView*) drawSquareByWidth: (CGFloat) Width
                    andRotate:(BOOL) rotate
                     atCenter:(CGPoint) center{
    UIView *square = [[UIView alloc ] initWithFrame:CGRectMake(0, 0, Width, Width)];
    square.center =center;
    square.backgroundColor = rotate ? [UIColor whiteColor] :[UIColor grayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;
}
-(void) rotateAllSquares {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i=0 ; i<self.view.subviews.count; i++) {
            if ( i%2==0 ) {
                ((UIView*)self.view.subviews[i]).transform =CGAffineTransformMakeRotation(M_PI_4);
            } else {
                ((UIView*)self.view.subviews[i]).transform =CGAffineTransformIdentity;
            } }
    }];
}
@end

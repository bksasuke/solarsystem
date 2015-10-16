//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Nested Square", CLASS: @"NestedSquare"},
                                    @{TITLE: @"Earth around", CLASS: @"EarthAndSun"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", };
    NSDictionary* advanced = @{SECTION: @"Advanced",};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"UIView Programming";
    mainScreen.about = @"Demo created by student";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end

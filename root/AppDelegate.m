//
//  AppDelegate.m
//  wapptwo
//
//  Created by user on 13-1-6.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "TabOneViewController.h"
#import "TabTwoViewController.h"
#import "TabThreeViewController.h"
#import "TabFourViewController.h"
#import "TabFiveViewController.h"


@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUInteger islog = W_LOG_OPEN;
    if (islog == W_LOG_OPEN) {
        self.window = [[[iConsoleWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    }else{
        self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    }
    
    [iConsole info:@"didFinishLaunchingWithOptions"];

    /* 显示status bar, 风格为透明 */
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarStyleBlackTranslucent];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
    
    /* 创建tabbar viewcontroller */
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.delegate = self;
    self.tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_bg.png"];
    self.tabBarController.tabBar.selectionIndicatorImage = [UIImage imageNamed:@"tabbar_selected.png"];
    
    /* 创建五个viewcontroller */
    UIViewController *viewController1 = [[[TabOneViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *viewController2 = [[[TabTwoViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *viewController3 = [[[TabThreeViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *viewController4 = [[[TabFourViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    UIViewController *viewController5 = [[[TabFiveViewController alloc] initWithNibName:nil bundle:nil] autorelease];
    
    /* 创建五个viewcontroller的导航条 */
    UINavigationController *nav_1 = [[UINavigationController alloc]initWithRootViewController:viewController1];
    UINavigationController *nav_2 = [[UINavigationController alloc]initWithRootViewController:viewController2];
    UINavigationController *nav_3 = [[UINavigationController alloc]initWithRootViewController:viewController3];
    UINavigationController *nav_4 = [[UINavigationController alloc]initWithRootViewController:viewController4];
    UINavigationController *nav_5 = [[UINavigationController alloc]initWithRootViewController:viewController5];
    
    [nav_1.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [nav_2.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [nav_3.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [nav_4.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [nav_5.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    /* 将五个NavigationController放到tabbar的数组中 */
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:nav_1, nav_2, nav_3, nav_4, nav_5, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

/* 当tabbar item被点击的时候 */
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{

}

// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    
}
#pragma mark -iconsole delegate method
- (void)handleConsoleCommand:(NSString *)command
{
	if ([command isEqualToString:@"version"])
	{
		[iConsole info:@"%@ version %@",
         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"],
		 [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
	}
	else
	{
		[iConsole error:@"unrecognised command, try 'version' instead"];
	}
}

@end

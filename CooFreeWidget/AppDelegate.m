//
//  AppDelegate.m
//  CooFreeWidget
//
//  Created by yssj on 2016/12/5.
//  Copyright © 2016年 CooFree. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

// ios9 之前
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    if ([url.scheme isEqualToString:@"medicalWdget"]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ExtenicationNotification" object:url];
        
    }
    return YES;
}
// ios9 之后
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    
    NSString* prefix = @"medicalWdget://action=";
    if ([[url absoluteString] rangeOfString:prefix].location != NSNotFound) {
        NSString* action = [[url absoluteString] substringFromIndex:prefix.length];
        if ([action isEqualToString:@"GotoHomePage"]) {
            [[NSUserDefaults standardUserDefaults ]setObject:@"season" forKey:@"img"];
            
        }
        else if([action isEqualToString:@"GotoOtherPage"]) {
           [[NSUserDefaults standardUserDefaults ]setObject:@"game" forKey:@"img"];
        }
        ViewController *view=[[ViewController alloc]init];
        
        [(UINavigationController *)self.window.rootViewController pushViewController:view animated:YES];
    }
//    if ([url.scheme isEqualToString:@"medicalWdget"]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"ExtenicationNotification" object:url];
//        
//    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

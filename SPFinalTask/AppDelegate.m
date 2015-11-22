//
//  AppDelegate.m
//  SPFinalTask
//
//  Created by popovychs on 21.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "AppDelegate.h"
#import "SPCoreData.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    [[SPCoreData sharedInstance] saveContext];
}

@end
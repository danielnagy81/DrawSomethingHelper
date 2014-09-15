//
//  AppDelegate.m
//  DrawSomethingHelper
//
//  Created by Dani on 15/09/14.
//  Copyright (c) 2014 Dani. All rights reserved.
//

#import "AppDelegate.h"
#import "Database.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Database createDatabase];
    
    return YES;
}

@end

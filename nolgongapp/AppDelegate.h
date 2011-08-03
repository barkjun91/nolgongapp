//
//  AppDelegate.h
//  nolgongapp
//
//  Created by Nolgong Powerhouse on 8/1/11.
//  Copyright Nolgong 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end

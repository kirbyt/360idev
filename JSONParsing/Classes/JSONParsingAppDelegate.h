//
//  JSONParsingAppDelegate.h
//  JSONParsing
//
//  Created by Kirby Turner on 4/14/10.
//  Copyright White Peak Software Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSONParsingAppDelegate : NSObject <UIApplicationDelegate> {
   UIWindow *window;
   NSMutableData *responseData;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


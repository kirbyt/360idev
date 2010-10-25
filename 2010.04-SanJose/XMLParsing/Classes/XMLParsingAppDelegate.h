//
//  XMLParsingAppDelegate.h
//  XMLParsing
//
//  Created by Kirby Turner on 4/14/10.
//  Copyright White Peak Software Inc 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMLParsingAppDelegate : NSObject <UIApplicationDelegate> {
   UIWindow *window;
   NSMutableData *responseData;
   NSString *currentText;
   NSString *lastTweet;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end


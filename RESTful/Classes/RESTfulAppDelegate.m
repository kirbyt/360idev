//
//  RESTfulAppDelegate.m
//  RESTful
//
//  Created by Kirby Turner on 4/14/10.
//  Copyright White Peak Software Inc 2010. All rights reserved.
//

#import "RESTfulAppDelegate.h"

@implementation RESTfulAppDelegate

@synthesize window;

- (void)callWebService:(NSString *)address {
   NSString *encodedAddress = [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   NSString *urlString = [NSString stringWithFormat:@"http://geocoder.us/service/rest/?address=%@", encodedAddress];
   NSURL *url = [NSURL URLWithString:urlString];
   NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
   NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
   [connection start];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
   responseData = [[NSMutableData alloc] init];
   [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
   [responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
   [connection release];
   
   NSString *xml = [NSString stringWithUTF8String:[responseData bytes]];
   NSLog(@"%@", xml);
   
   [responseData release];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   NSLog(@"Error: %@", [error localizedDescription]);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
   [self callWebService:@"301 South Market Street San Jose CA"];
	
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

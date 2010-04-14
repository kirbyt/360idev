//
//  XMLParsingAppDelegate.m
//  XMLParsing
//
//  Created by Kirby Turner on 4/14/10.
//  Copyright White Peak Software Inc 2010. All rights reserved.
//

#import "XMLParsingAppDelegate.h"

@implementation XMLParsingAppDelegate

@synthesize window;

- (void)callWebServiceWith:(NSString *)username usingFormat:(NSString*)format {
   NSString *encodedUsername = [username stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   NSString *urlString = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/user_timeline/%@.%@", encodedUsername, format];
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
   
   NSXMLParser *parser = [[NSXMLParser alloc] initWithData:responseData];
   [responseData release];

   [parser setDelegate:self]; // The parser calls methods in this class
   
   [parser parse];
   [parser release];
   
   NSLog(@"Last tweet: %@", lastTweet);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qualifiedName {
   if(qualifiedName) {
      elementName = qualifiedName;
   }

   if (nil == lastTweet) {
      if ([elementName isEqualToString:@"text"]) {
         lastTweet = currentText;
      }
   }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
   currentText = [NSString stringWithString:string];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
   // Override point for customization after application launch
   
   [self callWebServiceWith:@"kirbyt" usingFormat:@"xml"];
	
   [window makeKeyAndVisible];
   
   return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end

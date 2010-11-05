//
//  Tweets.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "SimpleTwitterClient.h"
#import "JSON.h"


@implementation SimpleTwitterClient

@synthesize delegate = _delegate;

- (void)retrieveTweetsForSearchTerm:(NSString *)term
{
   NSString *encodedTerm = [term stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
   NSString *string = [NSString stringWithFormat:@"http://search.twitter.com/search.json?&q=%@", encodedTerm];
   NSURL *url = [NSURL URLWithString:string];
   
   NSURLRequest *request = [NSURLRequest requestWithURL:url];
   NSURLResponse *response = nil;
   NSError *error = nil;
   // Remember: This is sample code. I normally would not make a synchronous web serivce call.
   NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

   if (!error) {
      NSString *responseString = [NSString stringWithUTF8String:[responseData bytes]];
      SBJsonParser *parser = [[SBJsonParser alloc] init];
      NSDictionary *data = [parser objectWithString:responseString];
      NSArray *tweets = [data objectForKey:@"results"];
      [parser release];
      
      if (_delegate && [_delegate respondsToSelector:@selector(simpleTwitterClient:didFinishRetrievingTweets:)]) {
         [_delegate simpleTwitterClient:self didFinishRetrievingTweets:tweets];
      }
   } else {
      if (_delegate && [_delegate respondsToSelector:@selector(simpleTwitterClient:didFailWithError:)]) {
         [_delegate simpleTwitterClient:self didFailWithError:error];
      }
   }
}

@end

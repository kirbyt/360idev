//
//  WebImage.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "WebImage.h"

@interface WebImage ()
@property (nonatomic, retain) NSMutableData *receivedData;
@end

@implementation WebImage

@synthesize delegate = _delegate;
@synthesize receivedData = _receivedData;

- (void)dealloc
{
   [_receivedData release], _receivedData = nil;
   
   [super dealloc];
}

- (void)downloadImageWithURL:(NSURL *)url
{
   NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
   NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self
                                                         startImmediately:NO];
   [request release];
   
   [connection scheduleInRunLoop:[NSRunLoop currentRunLoop]
                         forMode:NSRunLoopCommonModes];
   [connection start];
   
   if (connection) {
      NSMutableData *data = [[NSMutableData alloc] init];
      [self setReceivedData:data];
      [data release];
   } else {
      // Should handle error if this were a real app.
   }
}


#pragma mark -
#pragma mark NSURLConnection delegates

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
   [[self receivedData] setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   [[self receivedData] appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
   [connection release];
   if (_delegate && [_delegate respondsToSelector:@selector(webImage:didFailWithError:)]) {
      [_delegate webImage:self didFailWithError:error];
   }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   [connection release];
   
   NSData *data = [self receivedData];
   if (_delegate && [_delegate respondsToSelector:@selector(webImage:didFinishWithImage:)]) {
      UIImage *image = [UIImage imageWithData:data];
      [_delegate webImage:self didFinishWithImage:image];
   }
}

@end

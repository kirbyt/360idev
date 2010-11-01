//
//  FullScheduleViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/1/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "FullScheduleViewController.h"


@implementation FullScheduleViewController

@synthesize webView = _webView;

- (void)dealloc
{
   [_webView release], _webView = nil;
   [super dealloc];
}

- (void)viewDidUnload 
{
   [super viewDidUnload];
   
   [self setWebView:nil];
}

- (id)init
{
   self = [super initWithNibName:@"FullScheduleView" bundle:nil];
   if (self) {
      
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
   
   NSString *path = [[NSBundle mainBundle] pathForResource:@"schedule" ofType:@"pdf"];
   NSURL *url = [NSURL fileURLWithPath:path];
   NSURLRequest *request = [NSURLRequest requestWithURL:url];
   [_webView loadRequest:request];
}


@end

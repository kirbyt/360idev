//
//  SampleModelObject.m
//  AwesomeAppKit
//
//  Created by Kirby Turner on 9/11/11.
//  Copyright (c) 2011 White Peak Software Inc. All rights reserved.
//

#import "SampleModelObject.h"

@implementation SampleModelObject

@synthesize name = _name;

- (id)init 
{
   self = [super init];
   if (self) {
      [self setName:@"360|idev"];
   }
   return self;
}

- (NSString *)doSomethingInteresting
{
#if TARGET_OS_IPHONE 
   return @"Hello from iOS.";
#else
   return @"Hello from OS X.";
#endif
}

@end

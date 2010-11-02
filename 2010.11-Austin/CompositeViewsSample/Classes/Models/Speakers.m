//
//  Speakers.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "Speakers.h"


@implementation Speakers

- (void)dealloc
{
   [_speakers release], _speakers = nil;
   [super dealloc];
}

- (NSArray *)speakers
{
   if (_speakers) {
      return _speakers;
   }
   
   NSString *path = [[NSBundle mainBundle] pathForResource:@"speakers" ofType:@"plist"];
   _speakers = [[NSArray alloc] initWithContentsOfFile:path];
   return _speakers;
}

- (NSDictionary *)speakerNamed:(NSString *)speakerName
{
   NSDictionary *speaker = nil;
   if ([[self speakers] count] > 0) {
      speaker = [_speakers objectAtIndex:0];
   }
   return speaker;
}

@end

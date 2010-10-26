//
//  Speakers.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "Speakers.h"

NSString * const kSpeakerImage = @"image";
NSString * const kSpeakerBio = @"bio";

@implementation Speakers

- (NSArray *)speakers
{
   NSString *path = [[NSBundle mainBundle] pathForResource:@"speakers" ofType:@"plist"];
   NSArray *speakers = [NSArray arrayWithContentsOfFile:path];
   return speakers;
}

@end

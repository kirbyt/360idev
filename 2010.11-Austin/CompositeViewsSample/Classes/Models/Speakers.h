//
//  Speakers.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 10/25/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Speakers : NSObject 
{
   NSArray *_speakers;
}

- (NSArray *)speakers;
- (NSDictionary *)speakerNamed:(NSString *)speakerName;

@end

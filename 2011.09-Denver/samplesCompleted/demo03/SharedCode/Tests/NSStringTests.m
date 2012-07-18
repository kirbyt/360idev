//
//  NSStringTests.m
//  SharedCode
//
//  Created by Kirby Turner on 9/12/11.
//  Copyright (c) 2011 White Peak Software Inc. All rights reserved.
//

#import "NSStringTests.h"
#import "NSString+AwesomeAppKit.h"

@implementation NSStringTests

- (void)testStringWithUUID
{
   NSString *uuid = [NSString aa_stringWithUUID];
   STAssertNotNil(uuid, @"nil string.");
}

@end

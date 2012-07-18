//
//  NSString+AwesomeAppKit.m
//  AwesomeAppKit
//
//  Created by Kirby Turner on 9/11/11.
//  Copyright (c) 2011 White Peak Software Inc. All rights reserved.
//

#import "NSString+AwesomeAppKit.h"

@implementation NSString (AwesomeAppKit)

+ (NSString *)aa_stringWithUUID
{
   CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
   CFStringRef	uuidString = CFUUIDCreateString(kCFAllocatorDefault, uuidRef);
   
   // Create a new auto-release NSString to hold the UUID. This approach
   // is used to avoid leaking in a garbage collected environment.
   // 
   // From the Apple docs:
   // It is important to appreciate the asymmetry between Core Foundation and 
   // Cocoa—where retain, release, and autorelease are no-ops. If, for example, 
   // you have balanced a CFCreate… with release or autorelease, you will leak 
   // the object in a garbage collected environment:
   // http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/GarbageCollection/Articles/gcCoreFoundation.html
   //
   NSString *result = [NSString stringWithString:(__bridge NSString *)uuidString];
   
   CFRelease(uuidRef);
   CFRelease(uuidString);
   
   return result;
}

@end

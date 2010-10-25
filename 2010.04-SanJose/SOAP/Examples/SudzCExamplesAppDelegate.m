
#import "SudzCExamplesAppDelegate.h"
#import "SDZGeoCode_ServiceExample.h"


@implementation SudzCExamplesAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {

SDZGeoCode_ServiceExample* example1 = [[[SDZGeoCode_ServiceExample alloc] init] autorelease];
		[example1 run];


	[window makeKeyAndVisible];
}

- (void)dealloc {
	[window release];
	[super dealloc];
}

@end
			
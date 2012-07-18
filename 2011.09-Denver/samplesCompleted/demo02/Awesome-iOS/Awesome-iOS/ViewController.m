//
//  ViewController.m
//  Awesome-iOS
//
//  Created by Kirby Turner on 9/12/11.
//  Copyright (c) 2011 White Peak Software Inc. All rights reserved.
//

#import "ViewController.h"
#import "NSString+AwesomeAppKit.h"
#import "SampleModelObject.h"

@implementation ViewController
@synthesize helloLabel;
@synthesize uuidLabel;
@synthesize nameLabel;

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
   [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
   SampleModelObject *obj = [[SampleModelObject alloc] init];
   [[self helloLabel] setText:[obj doSomethingInteresting]];
   [[self nameLabel] setText:[obj name]];
   [[self uuidLabel] setText:[NSString aa_stringWithUUID]];
   
}

- (void)viewDidUnload
{
   [self setHelloLabel:nil];
   [self setUuidLabel:nil];
   [self setNameLabel:nil];
   [super viewDidUnload];
   // Release any retained subviews of the main view.
   // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
   [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
   // Return YES for supported orientations
   return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

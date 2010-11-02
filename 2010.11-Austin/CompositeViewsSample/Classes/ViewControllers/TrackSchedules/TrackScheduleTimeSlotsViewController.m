//
//  TrackScheduleTimeSlotsViewController.m
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "TrackScheduleTimeSlotsViewController.h"


@implementation TrackScheduleTimeSlotsViewController

@synthesize tableView = _tableView;

- (void)dealloc
{
   [_tableView release], _tableView = nil;
   [_data release], _data = nil;
   
   [super dealloc];
}

- (void)viewDidUnload
{
   [super viewDidUnload];
   
   [self setTableView:nil];
}

- (void)setData:(NSArray *)data
{
   _data = [data retain];
   [_tableView reloadData];
}


#pragma mark -
#pragma mark UITableView delegate and data methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
   return [_data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSString *identifier = @"TrackScheduleTimeSlotCell";
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
   if (cell == nil) {
      cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier] autorelease];
   }
   
   NSDictionary *session = [_data objectAtIndex:[indexPath row]];
   [[cell textLabel] setText:[session objectForKey:@"title"]];
   [[cell detailTextLabel] setText:[session objectForKey:@"timeSlot"]];

   return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

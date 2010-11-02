//
//  TrackScheduleTimeSlotsViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TrackScheduleSessionViewController;

@interface TrackScheduleTimeSlotsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
   UITableView *_tableView;
   UINavigationBar *_navBar;
   NSDictionary *_data;
   TrackScheduleSessionViewController *_contentController;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, assign) IBOutlet TrackScheduleSessionViewController *contentController;


- (void)setData:(NSDictionary *)data;

@end

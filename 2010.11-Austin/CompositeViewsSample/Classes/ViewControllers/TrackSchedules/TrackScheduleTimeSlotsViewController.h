//
//  TrackScheduleTimeSlotsViewController.h
//  CompositeViewsSample
//
//  Created by Kirby Turner on 11/2/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TrackScheduleTimeSlotsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
   UITableView *_tableView;
   NSArray *_data;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;


- (void)setData:(NSArray *)data;

@end

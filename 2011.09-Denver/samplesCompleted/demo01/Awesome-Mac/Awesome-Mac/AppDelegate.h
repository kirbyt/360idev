//
//  AppDelegate.h
//  Awesome-Mac
//
//  Created by Kirby Turner on 9/12/11.
//  Copyright (c) 2011 White Peak Software Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (weak) NSTextField *helloLabel;
@property (weak) NSTextField *uuidLabel;
@property (weak) NSTextField *nameLabel;

- (IBAction)saveAction:(id)sender;

@end

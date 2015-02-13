//
//  NoteListDelegate.h
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern NSString *const kNoteCell;

@interface NoteListDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

- (void)saveNote:(NSString *)noteText;

@end

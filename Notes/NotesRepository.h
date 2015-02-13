//
//  NotesRepository.h
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kNotes;

@interface NotesRepository : NSObject

- (NSString *)noteAtIndex:(NSUInteger)index;
- (NSArray *)getAll;
- (void)saveNote:(NSString *)noteText;

@end

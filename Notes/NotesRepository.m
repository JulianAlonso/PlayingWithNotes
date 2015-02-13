//
//  NotesRepository.m
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import "NotesRepository.h"

NSString *const kNotes = @"kNotesId";

@interface NotesRepository()

@property (nonatomic, strong) NSMutableArray *notes;

@end

@implementation NotesRepository

#pragma mark - Inits methods.

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _notes = [[self readFromUserDefults] mutableCopy];
        if (!_notes)
        {
            _notes = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

#pragma mark - Resources methods.

- (NSArray *)getAll
{
    return self.notes;
}

- (NSString *)noteAtIndex:(NSUInteger)index
{
    return [self.notes objectAtIndex: index];
}

- (void)saveNote:(NSString *)noteText
{
    [self.notes addObject:noteText];
    
    [self saveToUserDefaults:self.notes];
}

#pragma mark - UserDefaults methods.
- (NSArray *)readFromUserDefults
{
    return [[NSUserDefaults standardUserDefaults] arrayForKey:kNotes];
}

- (void)saveToUserDefaults:(NSArray *)notes
{
    [[NSUserDefaults standardUserDefaults] setObject:notes forKey:kNotes];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Dealoc
- (void)dealloc
{
    [self saveToUserDefaults:self.notes];
}

@end

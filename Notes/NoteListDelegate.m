//
//  NoteListDelegate.m
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import "NoteListDelegate.h"
#import "NotesRepository.h"

NSString *const kNoteCell = @"kNoteCellId";

@interface NoteListDelegate ()

@property (nonatomic, strong) NotesRepository *repository;

@end

@implementation NoteListDelegate

#pragma mark - Inits methods.
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _repository = [[NotesRepository alloc] init];
    }
    
    return self;
}

#pragma mark - TableViewDelegate methods.

#pragma mark - DataSource methods.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.repository getAll].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNoteCell];
    
    cell.textLabel.text = [self.repository noteAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - Custom methods.
- (void)saveNote:(NSString *)noteText
{
    [self.repository saveNote:noteText];
}

@end

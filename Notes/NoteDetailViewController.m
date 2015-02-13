//
//  NoteDetailViewController.m
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import "NoteDetailViewController.h"

@interface NoteDetailViewController()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end

@implementation NoteDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configCancelButton];
    [self configSaveButton];
}

#pragma mark - Config methods.
- (void)configSaveButton
{
    self.saveButton.target = self;
    self.saveButton.action = @selector(saveNote);
}

- (void)configCancelButton
{
    self.cancelButton.target = self;
    self.cancelButton.action = @selector(dismissMe);
}

#pragma mark - own methods.
- (void)dismissMe
{
    [self.delegado iNeedDismiss];
}

- (void)saveNote
{
    [self.delegado saveNote:self.noteTextView.text];
}
@end

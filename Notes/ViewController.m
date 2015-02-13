//
//  ViewController.m
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import "ViewController.h"
#import "NoteListDelegate.h"
#import "NoteDetailViewController.h"

@interface ViewController () <PresenterDelegateProtocol>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *createButton;
@property (weak, nonatomic) IBOutlet UITableView *notesList;

@property (nonatomic, strong) NoteListDelegate *noteListDelegate;

@property (nonatomic, strong) NoteDetailViewController *noteDetailViewController;

@end

@implementation ViewController

#pragma mark - ViewCicle methods.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //INITS
    [self initNoteListDelegate];
    //CONFIGS
    [self configNotesList];
    [self configCreteButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - InitComponents methods.
- (void)initNoteListDelegate
{
    self.noteListDelegate = [[NoteListDelegate alloc] init];
}
#pragma mark - ConfigureComponents methods.
- (void)configNotesList
{
    self.notesList.delegate = self.noteListDelegate;
    self.notesList.dataSource = self.noteListDelegate;
}

- (void)configCreteButton
{
    self.createButton.target = self;
    self.createButton.action = @selector(createNote);
}

#pragma mark - PresenterDelegateProtocol methods.
-(void)iNeedDismiss
{
    [self.noteDetailViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)saveNote:(NSString *)noteText
{
    [self.noteListDelegate saveNote:noteText];
    [self iNeedDismiss];
    
    [self.notesList reloadData];
}

#pragma mark - Button Action methods.
- (void)createNote
{
    UINavigationController *nc = [self.storyboard instantiateViewControllerWithIdentifier:@"noteDetail"];
    self.noteDetailViewController = (NoteDetailViewController *)nc.topViewController;
    self.noteDetailViewController.delegado = self;
    
    [self presentViewController:nc animated:YES completion:nil];
}

- (void)print
{
    NSLog(@"ho");
}
@end

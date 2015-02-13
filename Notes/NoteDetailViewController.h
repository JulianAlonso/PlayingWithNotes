//
//  NoteDetailViewController.h
//  Notes
//
//  Created by Julian Alonso on 12/2/15.
//  Copyright (c) 2015 Julian Alonso. All rights reserved.
//

#import "ViewController.h"

@protocol PresenterDelegateProtocol <NSObject>

- (void)iNeedDismiss;
- (void)saveNote:(NSString *)noteText;

@end

@interface NoteDetailViewController : ViewController

@property (nonatomic, weak) UIViewController<PresenterDelegateProtocol> *delegado;

@end

//
//  PontuacaoViewController.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PontuacaoTableViewCell.h"

@interface PontuacaoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modoJogo;
- (IBAction)trocaModoJogo:(id)sender;

@end

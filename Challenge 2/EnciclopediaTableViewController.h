//
//  EnciclopediaTableViewController.h
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnciclopediaTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tabelaEnciclopedia;

@end

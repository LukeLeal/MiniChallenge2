//
//  EnciclopediaViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "EnciclopediaViewController.h"
#import "DoencaManager.h"
#import "Doenca.h"

@interface EnciclopediaViewController (){
    NSArray *doencas; 
}

@end

@implementation EnciclopediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Enciclopédia"];
    [_tabelaEnciclopedia setDelegate:self];
    [_tabelaEnciclopedia setDataSource:self];
}

-(void) viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}



#pragma mark - Table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *celula = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celula"];
    
    doencas = [[DoencaManager sharedInstance] doencas];
    
    long row = [indexPath row];
    
    [celula.textLabel setText: [(Doenca *)[doencas objectAtIndex:(int) row] nome]];
    
    
    return celula;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    doencas = [[DoencaManager sharedInstance] doencas];
    return doencas.count;
}


@end
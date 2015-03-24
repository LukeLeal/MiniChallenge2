//
//  PontuacaoViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "PontuacaoViewController.h"

@interface PontuacaoViewController ()

@end

@implementation PontuacaoViewController

@synthesize tableView, modoJogo;

- (void)viewDidLoad {
    [super viewDidLoad];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
}

#pragma mark - Table

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger i = modoJogo.selectedSegmentIndex;
    
    PontuacaoTableViewCell *celula = [self.tableView dequeueReusableCellWithIdentifier:@"celulaPadrao"];
    
//    switch (i) {
//        case 0:
//            [celula.nome setText:];
//            [celula.pontos setText:];
//            [celula.avatar setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
//            break;
//            
//        case 2:
//            [celula.nome setText:];
//            [celula.pontos setText:];
//            [celula.avatar setImage:[UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
//            break;
//    }
    
    return celula;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Segmented Control
- (IBAction)trocaModoJogo:(id)sender {
    [self.tableView reloadData];
}
@end

//
//  PontuacaoTableViewCell.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PontuacaoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *pontos;

@end

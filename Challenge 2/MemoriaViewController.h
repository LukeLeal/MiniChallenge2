//
//  MemoriaViewController.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoriaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *img1;
@property (weak, nonatomic) IBOutlet UIButton *img2;
@property (weak, nonatomic) IBOutlet UIButton *img3;
@property (weak, nonatomic) IBOutlet UIButton *img4;
//@property (weak, nonatomic) IBOutlet UIButton *img5;
//@property (weak, nonatomic) IBOutlet UIButton *img6;


- (IBAction)botao:(UIButton *)sender;

@end

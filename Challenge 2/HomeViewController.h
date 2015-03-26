//
//  HomeViewController.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PontuacaoViewController.h"
#import "EnciclopediaViewController.h"
#import "JogosViewController.h"
#import <iAd/iAd.h>

@interface HomeViewController : UIViewController <ADBannerViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *jogar;
@property (weak, nonatomic) IBOutlet UIButton *pontuacao;
@property (weak, nonatomic) IBOutlet UIButton *enciclopedia;
@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

- (IBAction)jogarBotao:(id)sender;
- (IBAction)pontuacaoBotao:(id)sender;
- (IBAction)enciclopediaBotao:(id)sender;

#pragma mark - adBanner
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error;
//- (void)bannerViewActionDidFinish:(ADBannerView *)banner;
//- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave;
//- (void)bannerViewDidLoadAd:(ADBannerView *)banner;

@end

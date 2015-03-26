//
//  OpcoesJogosViewController.h
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizViewController.h"
#import <iAd/iAd.h>

@interface JogosViewController : UIViewController <ADBannerViewDelegate>

@property (weak, nonatomic) IBOutlet ADBannerView *adBanner;

- (IBAction)memoriaBotao:(id)sender;
- (IBAction)quizBotao:(id)sender;
- (IBAction)rouletteBotao:(id)sender;


#pragma mark - adBanner
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error;
//- (void)bannerViewActionDidFinish:(ADBannerView *)banner;
//- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave;
//- (void)bannerViewDidLoadAd:(ADBannerView *)banner;


@end

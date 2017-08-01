//
//  iWPAdsManager.h
//  iwebsearchpro
//
//  Created by iMokhles on 9/2/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

// Manager Ads From This Class

#import <Foundation/Foundation.h>

// Ads Headers
#import <RevMobAds/RevMobAds.h>
#import "AppLovin/ALSdk.h"
#import "AppLovin/ALInterstitialAd.h"

@interface iWPAdsManager : NSObject <RevMobAdsDelegate>
+ (iWPAdsManager *)startAds;

//Revmob
-(void)initRevMob: (NSString*)applicationID testMode:(BOOL)revTest;
-(void)revMobAdsShowBanner;
-(void)revMobAdsFullScreen;
-(void)revMobAdsShowPopup;

//AppLovin
-(void)initAppLovin;
-(void)appLovinShowInterstitial;

@end

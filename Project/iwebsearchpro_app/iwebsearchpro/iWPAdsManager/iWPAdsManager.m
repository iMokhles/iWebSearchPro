//
//  iWPAdsManager.m
//  iwebsearchpro
//
//  Created by iMokhles on 9/2/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

#import "iWPAdsManager.h"

static iWPAdsManager *sharedInstance = nil;

@implementation iWPAdsManager

+ (iWPAdsManager *)startAds {
    if (sharedInstance == nil)
    {
        sharedInstance = [[iWPAdsManager alloc] init];
    }
    
    return sharedInstance;
}

//RevMobAds
-(void)initRevMob:(NSString *)applicationID testMode:(BOOL)revTest {
    
    if(revTest == YES) {
        [RevMobAds startSessionWithAppID:applicationID];
        [RevMobAds session].testingMode = RevMobAdsTestingModeWithAds;
    }
    else {
        [RevMobAds startSessionWithAppID:applicationID];
    }
}
-(void)revMobAdsShowBanner {
    [[RevMobAds session] showBanner];
}
-(void)revMobAdsFullScreen {
    [[RevMobAds session] showFullscreen];
}
-(void)revMobAdsShowPopup {
    [[RevMobAds session] showPopup];
}
-(void)revmobAdDidFailWithError:(NSError *)error {
    if(error) {
        NSLog(@"%@",error);
    }
}

//Applovin
-(void)initAppLovin {
    [ALSdk initializeSdk];
}
-(void)appLovinShowInterstitial {
    [ALInterstitialAd showOver:[[UIApplication sharedApplication] keyWindow]];
}

@end

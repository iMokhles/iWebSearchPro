//
//  IWPViewController.h
//  iwebsearchpro
//
//  Created by iMokhles on 8/6/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

// iOS Frameworks
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>

// Vendors Headers
#import "RNGridMenu.h"
#import "TUSafariActivity.h"
#import "ARChromeActivity.h"
#import "MLCruxActivity.h"

// Test Color
#import "ColorPicker/ColorPicker.h"

// iWPAdsManager
#import "iWPAdsManager/iWPAdsManager.h"

// titles prefs keys
#define kWikipediaKey   @"WikipediaPrefs"
#define kFacebookKey    @"FacebookPrefs"
#define kTwitterKey     @"TwitterPrefs"
#define kEbayKey        @"EbayPrefs"
#define kAmazonKey      @"AmazonPrefs"
#define kYoutubeKey     @"YoutubePrefs"
#define kInstagram      @"InstagramPrefs"
#define kLeBoncoinKey   @"LeBoncoinPrefs"
#define kiTunesKey      @"iTunesPrefs"
#define kAppStoreKey    @"AppStorePrefs"
#define kQuranKey       @"QuranPrefs"

// icons prefs keys
#define kWikipediaIcon   @"WikipediaIcon"
#define kFacebookIcon    @"FacebookIcon"
#define kTwitterIcon     @"TwitterIcon"
#define kEbayIcon        @"EbayIcon"
#define kAmazonIcon      @"AmazonIcon"
#define kYoutubeIcon     @"YoutubeIcon"
#define kInstagramIcon   @"InstagramIcon"
#define kLeBoncoinIcon   @"LeBoncoinIcon"
#define kiTunesIcon      @"iTunesIcon"
#define kAppStoreIcon    @"AppStoreIcon"
#define kQuranIcon       @"QuranIcon"

@interface IWPViewController : UIViewController <UISearchBarDelegate, RNGridMenuDelegate> {
    // titles prefs integer
    NSInteger wiNUM;
    NSInteger fbNUM;
    NSInteger twNUM;
    NSInteger ebNUM;
    NSInteger amNUM;
    NSInteger yuNUM;
    NSInteger inNUM;
    NSInteger lbNUM;
    NSInteger itNUM;
    NSInteger apNUM;
    NSInteger quNUM;
    
    // icons prefs integer
    NSInteger wiIcon;
    NSInteger fbIcon;
    NSInteger twIcon;
    NSInteger ebIcon;
    NSInteger amIcon;
    NSInteger yuIcon;
    NSInteger inIcon;
    NSInteger lbIcon;
    NSInteger itIcon;
    NSInteger apIcon;
    NSInteger quIcon;
}
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet NSURL *webURL;
@property (strong, nonatomic) IBOutlet UIButton *infoButton;
@property (strong, nonatomic) IBOutlet UIToolbar *toolShare;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *shareButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *bckButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *frdButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *refButton;
@property (strong, nonatomic) IBOutlet NSURLRequest *webURLRequest;

// titles prefs grabber
-(id)grabPrefWiki:(NSInteger)wikiNUM;
-(id)grabPrefFace:(NSInteger)faceNUM;
-(id)grabPrefTwit:(NSInteger)twitNUM;
-(id)grabPrefEbay:(NSInteger)ebayNUM;
-(id)grabPrefAmaz:(NSInteger)amazNUM;
-(id)grabPrefYout:(NSInteger)youtNUM;
-(id)grabPrefInst:(NSInteger)instNUM;
-(id)grabPrefLebo:(NSInteger)leboNUM;
-(id)grabPrefiTun:(NSInteger)itunNUM;
-(id)grabPrefApps:(NSInteger)appsNUM;
-(id)grabPrefQura:(NSInteger)quraNUM;

// icons prefs grabber
-(id)grabIconWiki:(NSInteger)wikiIcon;
-(id)grabIconFace:(NSInteger)faceIcon;
-(id)grabIconTwit:(NSInteger)twitIcon;
-(id)grabIconEbay:(NSInteger)ebayIcon;
-(id)grabIconAmaz:(NSInteger)amazIcon;
-(id)grabIconYout:(NSInteger)youtIcon;
-(id)grabIconInst:(NSInteger)instIcon;
-(id)grabIconLebo:(NSInteger)leboIcon;
-(id)grabIconiTun:(NSInteger)itunIcon;
-(id)grabIconApps:(NSInteger)appsIcon;
-(id)grabIconQura:(NSInteger)quraIcon;

- (IBAction)sitesSearch:(UIBarButtonItem *)sender;
- (IBAction)aboutPressed:(id)sender;

// Show Ads
- (void)showAds;
@end

//
//  IWPViewController.m
//  iwebsearchpro
//
//  Created by iMokhles on 8/6/14.
//  Copyright (c) 2014 iMokhles. All rights reserved.
//

#import "IWPViewController.h"

@interface IWPViewController ()

@end

@implementation IWPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Settings declaration
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // titles prefs
    wiNUM = [((NSNumber*)[defaults valueForKey:kWikipediaKey]) integerValue];
    fbNUM = [((NSNumber*)[defaults valueForKey:kFacebookKey]) integerValue];
    twNUM = [((NSNumber*)[defaults valueForKey:kTwitterKey]) integerValue];
    ebNUM = [((NSNumber*)[defaults valueForKey:kEbayKey]) integerValue];
    amNUM = [((NSNumber*)[defaults valueForKey:kAmazonKey]) integerValue];
    yuNUM = [((NSNumber*)[defaults valueForKey:kYoutubeKey]) integerValue];
    inNUM = [((NSNumber*)[defaults valueForKey:kInstagram]) integerValue];
    lbNUM = [((NSNumber*)[defaults valueForKey:kLeBoncoinKey]) integerValue];
    itNUM = [((NSNumber*)[defaults valueForKey:kiTunesKey]) integerValue];
    apNUM = [((NSNumber*)[defaults valueForKey:kAppStoreKey]) integerValue];
    quNUM = [((NSNumber*)[defaults valueForKey:kQuranKey]) integerValue];
    
    // icons prefs
    wiIcon = [((NSNumber*)[defaults valueForKey:kWikipediaIcon]) integerValue];
    fbIcon = [((NSNumber*)[defaults valueForKey:kFacebookIcon]) integerValue];
    twIcon = [((NSNumber*)[defaults valueForKey:kTwitterIcon]) integerValue];
    ebIcon = [((NSNumber*)[defaults valueForKey:kEbayIcon]) integerValue];
    amIcon = [((NSNumber*)[defaults valueForKey:kAmazonIcon]) integerValue];
    yuIcon = [((NSNumber*)[defaults valueForKey:kYoutubeIcon]) integerValue];
    inIcon = [((NSNumber*)[defaults valueForKey:kInstagramIcon]) integerValue];
    lbIcon = [((NSNumber*)[defaults valueForKey:kLeBoncoinIcon]) integerValue];
    itIcon = [((NSNumber*)[defaults valueForKey:kiTunesIcon]) integerValue];
    apIcon = [((NSNumber*)[defaults valueForKey:kAppStoreIcon]) integerValue];
    quIcon = [((NSNumber*)[defaults valueForKey:kQuranIcon]) integerValue];
    
    // Search Bar Delegate
    [self.searchBar setDelegate:self];
    
    // Default webPage
    self.webURL = [NSURL URLWithString:@"http://www.google.com"];
    self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
    [self.webView loadRequest:self.webURLRequest];
    
    // Appearence Customization
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.369 green:0.373 blue:0.431 alpha:1.000];
    self.toolShare.barTintColor = [UIColor colorWithRed:0.369 green:0.373 blue:0.431 alpha:1.000];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    [[self.navigationController navigationBar] setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    self.toolShare.translucent = NO;
    self.shareButton.tintColor = [UIColor whiteColor];
    self.refButton.tintColor = [UIColor whiteColor];
    self.bckButton.tintColor = [UIColor whiteColor];
    self.frdButton.tintColor = [UIColor whiteColor];
    
    // First Page title
    [self.navigationItem setTitle:@"Home"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
//    [self showAds];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return  UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBar Delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    // Do the search...
    [self showGrid];
}

#pragma mark - RNGridMenuDelegate

- (void)gridMenu:(RNGridMenu *)gridMenu willDismissWithSelectedItem:(RNGridMenuItem *)item atIndex:(NSInteger)itemIndex {
    if ([item.title isEqualToString:@"Wikipedia"]) {
        
        NSString *wiki = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://en.m.wikipedia.org/wiki/%@", wiki]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Facebook"]) {
        
        NSString *facebook = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://m.facebook.com/?refsrc=http://www.facebook.com/&_rdr#!/search/?query=%@", facebook]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Twitter"]) {
        
        NSString *twitter = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://mobile.twitter.com/search?q=%@", twitter]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Ebay"]) {
        
        NSString *ebayAction = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://shop.mobileweb.ebay.com/searchresults;PdsSession=03fb854c13b0a5abe586b7f6fffe969e?kw=%@", ebayAction]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Amazon"]) {
        
        NSString *amazonAction = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.amazon.com/gp/aw/s/ref=is_box_?k=%@", amazonAction]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Youtube"]) {
        
        NSString *youtube = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://m.youtube.com/results?q=%@", youtube]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Instagram"]) {
        
        NSString *insta = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://web.stagram.com/search/%@/", insta]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Le Boncoin"]) {
        
        NSString *boncoinAction = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.leboncoin.fr/annonces/offres/ile_de_france/?f=a&th=1&q=%@", boncoinAction]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"iTunes"]) {
        
        NSString *itunes = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://phobos.apple.com/WebObjects/MZSearch.woa/wa/search?WOURLEncoding=ISO8859_1&lang=1&output=lm&country=US&term=%@", itunes]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"AppStore"]) {
        
        NSString *appstoreAction = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://ax.search.itunes.apple.com/WebObjects/MZSearch.woa/wa/search?media=software&term=%@", appstoreAction]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    } if ([item.title isEqualToString:@"Quran"]) {
        
        NSString *quranAction = [self.searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        self.webURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.al-islam.com/portal.aspx?pageid=1238&Words=%@", quranAction]];
        self.webURLRequest = [NSURLRequest requestWithURL:self.webURL];
        [self.webView loadRequest:self.webURLRequest];
        
    }
    NSLog(@"Dismissed with item %ld: %@", (long)itemIndex, item.title);
}

#pragma mark - GridMenu

- (void)showGrid {
    NSInteger numberOfOptions = 11;
    NSArray *items = @[
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconWiki:wiIcon] title:[self grabPrefWiki:wiNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconFace:fbIcon] title:[self grabPrefFace:fbNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconTwit:twIcon] title:[self grabPrefTwit:twNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconEbay:ebIcon] title:[self grabPrefEbay:ebNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconAmaz:amIcon] title:[self grabPrefAmaz:amNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconYout:yuIcon] title:[self grabPrefYout:yuNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconInst:inIcon] title:[self grabPrefInst:inNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconLebo:lbIcon] title:[self grabPrefLebo:lbNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconiTun:itIcon] title:[self grabPrefiTun:itNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconApps:apIcon] title:[self grabPrefApps:apNUM]],
                       [[RNGridMenuItem alloc] initWithImage:[self grabIconQura:quIcon] title:[self grabPrefQura:quNUM]],
                       ];
    RNGridMenu *av = [[RNGridMenu alloc] initWithItems:[items subarrayWithRange:NSMakeRange(0, numberOfOptions)]];
    av.delegate = self;
    //av.bounces = YES; // Enable if you want bounce animation
    //av.itemFont = [UIFont boldSystemFontOfSize:18]; // Changing titles font and size
    //av.itemSize = CGSizeMake(130, 35); // change icons size
    [av showInViewController:self center:CGPointMake(self.view.bounds.size.width/2.f, self.view.bounds.size.height/2.f)];
}

#pragma mark - Prefs Icons Grabbers

-(id)grabIconWiki:(NSInteger)wikiIcon {
    switch (wikiIcon) {
        case 0:
            return [UIImage imageNamed:@"wikipedia"];
        case 1:
            return [UIImage imageNamed:@"facebook"];
        case 2:
            return [UIImage imageNamed:@"twitter"];
        case 3:
            return [UIImage imageNamed:@"ebay"];
        case 4:
            return [UIImage imageNamed:@"amazon"];
        case 5:
            return [UIImage imageNamed:@"youtube"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"wikipedia"];
    }
}
-(id)grabIconFace:(NSInteger)faceIcon {
    switch (faceIcon) {
        case 0:
            return [UIImage imageNamed:@"facebook"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"twitter"];
        case 3:
            return [UIImage imageNamed:@"ebay"];
        case 4:
            return [UIImage imageNamed:@"amazon"];
        case 5:
            return [UIImage imageNamed:@"youtube"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"facebook"];
    }
}
-(id)grabIconTwit:(NSInteger)twitIcon {
    switch (twitIcon) {
        case 0:
            return [UIImage imageNamed:@"twitter"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"ebay"];
        case 4:
            return [UIImage imageNamed:@"amazon"];
        case 5:
            return [UIImage imageNamed:@"youtube"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"twitter"];
    }
}
-(id)grabIconEbay:(NSInteger)ebayIcon {
    switch (ebayIcon) {
        case 0:
            return [UIImage imageNamed:@"ebay"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"amazon"];
        case 5:
            return [UIImage imageNamed:@"youtube"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"ebay"];
    }
}
-(id)grabIconAmaz:(NSInteger)amazIcon {
    switch (amazIcon) {
        case 0:
            return [UIImage imageNamed:@"amazon"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"youtube"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"amazon"];
    }
}
-(id)grabIconYout:(NSInteger)youtIcon {
    switch (youtIcon) {
        case 0:
            return [UIImage imageNamed:@"youtube"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"instagram"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"youtube"];
    }
}
-(id)grabIconInst:(NSInteger)instIcon {
    switch (instIcon) {
        case 0:
            return [UIImage imageNamed:@"instagram"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"youtube"];
        case 7:
            return [UIImage imageNamed:@"boncoin"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"instagram"];
    }
}
-(id)grabIconLebo:(NSInteger)leboIcon {
    switch (leboIcon) {
        case 0:
            return [UIImage imageNamed:@"boncoin"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"youtube"];
        case 7:
            return [UIImage imageNamed:@"instagram"];
        case 8:
            return [UIImage imageNamed:@"itunes"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"boncoin"];
    }
}
-(id)grabIconiTun:(NSInteger)itunIcon {
    switch (itunIcon) {
        case 0:
            return [UIImage imageNamed:@"itunes"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"youtube"];
        case 7:
            return [UIImage imageNamed:@"instagram"];
        case 8:
            return [UIImage imageNamed:@"boncoin"];
        case 9:
            return [UIImage imageNamed:@"appstore"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"itunes"];
    }
}
-(id)grabIconApps:(NSInteger)appsIcon {
    switch (appsIcon) {
        case 0:
            return [UIImage imageNamed:@"appstore"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"youtube"];
        case 7:
            return [UIImage imageNamed:@"instagram"];
        case 8:
            return [UIImage imageNamed:@"boncoin"];
        case 9:
            return [UIImage imageNamed:@"itunes"];
        case 10:
            return [UIImage imageNamed:@"quran"];
        default:
            return [UIImage imageNamed:@"appstore"];
    }
}
-(id)grabIconQura:(NSInteger)quraIcon {
    switch (quraIcon) {
        case 0:
            return [UIImage imageNamed:@"quran"];
        case 1:
            return [UIImage imageNamed:@"wikipedia"];
        case 2:
            return [UIImage imageNamed:@"facebook"];
        case 3:
            return [UIImage imageNamed:@"twitter"];
        case 4:
            return [UIImage imageNamed:@"ebay"];
        case 5:
            return [UIImage imageNamed:@"amazon"];
        case 6:
            return [UIImage imageNamed:@"youtube"];
        case 7:
            return [UIImage imageNamed:@"instagram"];
        case 8:
            return [UIImage imageNamed:@"boncoin"];
        case 9:
            return [UIImage imageNamed:@"itunes"];
        case 10:
            return [UIImage imageNamed:@"appstore"];
        default:
            return [UIImage imageNamed:@"quran"];
    }
}

#pragma mark - Prefs Tiltes Grabbers

-(id)grabPrefWiki:(NSInteger)wikiNUM {
    switch (wikiNUM) {
        case 0:
            return @"Wikipedia";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Wikipedia";
    }
    
}
-(id)grabPrefFace:(NSInteger)faceNUM {
    switch (faceNUM) {
        case 0:
            return @"Facebook";
        case 1:
            return @"Wikipedia";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Facebook";
    }
}
-(id)grabPrefTwit:(NSInteger)twitNUM {
    switch (twitNUM) {
        case 0:
            return @"Twitter";
        case 1:
            return @"Facebook";
        case 2:
            return @"Wikipedia";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Twitter";
    }
}
-(id)grabPrefEbay:(NSInteger)ebayNUM {
    switch (ebayNUM) {
        case 0:
            return @"Ebay";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Wikipedia";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Ebay";
    }
}
-(id)grabPrefAmaz:(NSInteger)amazNUM {
    switch (amazNUM) {
        case 0:
            return @"Amazon";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Wikipedia";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Amazon";
    }
}
-(id)grabPrefYout:(NSInteger)youtNUM {
    switch (youtNUM) {
        case 0:
            return @"Youtube";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Wikipedia";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Youtube";
    }
}
-(id)grabPrefInst:(NSInteger)instNUM {
    switch (instNUM) {
        case 0:
            return @"Instagram";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Wikipedia";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Instagram";
    }
}
-(id)grabPrefLebo:(NSInteger)leboNUM {
    switch (leboNUM) {
        case 0:
            return @"Le Boncoin";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Wikipedia";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"Le Boncoin";
    }
}
-(id)grabPrefiTun:(NSInteger)itunNUM {
    switch (itunNUM) {
        case 0:
            return @"iTunes";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"Wikipedia";
        case 9:
            return @"AppStore";
        case 10:
            return @"Quran";
        default:
            return @"iTunes";
    }
}
-(id)grabPrefApps:(NSInteger)appsNUM {
    switch (appsNUM) {
        case 0:
            return @"AppStore";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"Wikipedia";
        case 10:
            return @"Quran";
        default:
            return @"AppStore";
    }
}
-(id)grabPrefQura:(NSInteger)quraNUM {
    switch (quraNUM) {
        case 0:
            return @"Quran";
        case 1:
            return @"Facebook";
        case 2:
            return @"Twitter";
        case 3:
            return @"Ebay";
        case 4:
            return @"Amazon";
        case 5:
            return @"Youtube";
        case 6:
            return @"Instagram";
        case 7:
            return @"Le Boncoin";
        case 8:
            return @"iTunes";
        case 9:
            return @"AppStore";
        case 10:
            return @"Wikipedia";
        default:
            return @"Quran";
    }
}

#pragma mark - Button Actions

- (IBAction)sitesSearch:(UIBarButtonItem *)sender {
    
    NSURL *url = self.webView.request.URL;
    NSString *text = [NSString stringWithFormat:@"This link shared from %@ Application", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]];
    NSArray *activityItems;
    activityItems = @[url, text];
    
    // activities
    TUSafariActivity     *safariActivity     = [[TUSafariActivity alloc] init];
    ARChromeActivity     *chromeActivity     = [[ARChromeActivity alloc] init];
    MLCruxActivity       *cruxActivity       = [[MLCruxActivity alloc] init];
    
    NSArray *activities = @[
                            safariActivity,
                            chromeActivity,
                            cruxActivity,];
    
    // UIActivityViewController
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                               applicationActivities:activities];
    
    /* Exclude default activity types for demo.
     activityView.excludedActivityTypes = @[
     UIActivityTypeAssignToContact,
     UIActivityTypeCopyToPasteboard,
     UIActivityTypePostToFacebook,
     UIActivityTypePostToTwitter,
     UIActivityTypePostToWeibo,
     UIActivityTypePrint,
     UIActivityTypeMail,
     UIActivityTypeMessage,
     UIActivityTypeSaveToCameraRoll,
     ];
     */
    // Present UIActivityViewController
    [self presentViewController:activityView animated:YES completion:nil];
}

- (IBAction)aboutPressed:(id)sender {
    // Used StoryBoard Action ;)
}

#pragma mark - Show Ads
- (void)showAds {
    [[iWPAdsManager startAds] initRevMob:@"5405adf02a4cde7e45bc1ba4" testMode:NO];
    [[iWPAdsManager startAds] revMobAdsFullScreen];
}
@end

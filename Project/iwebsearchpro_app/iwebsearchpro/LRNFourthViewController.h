//
//  LRNFourthViewController.h
//  iWebSearchPro
//
//  Created by iMokhles on 11/3/13.
//  Copyright (c) 2013 iMokhles LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Social/Social.h>
#import <MessageUI/MessageUI.h>
#import "LeveyPopListView.h"
#import "EGYWebViewController.h"


@interface LRNFourthViewController : UITableViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, LeveyPopListViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *abouAppname;
@property (weak, nonatomic) IBOutlet UILabel *aboutAppVersion;
@property (weak, nonatomic) IBOutlet UITableViewCell *iMokhAbout;
@property (strong, nonatomic) NSArray *options;
@property (weak, nonatomic) IBOutlet UITableViewCell *AmhsAbout;
@property (strong, nonatomic) NSArray *optionsAmhs;

@end

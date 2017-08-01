//
//  LRNFourthViewController.m
//  iWebSearchPro
//
//  Created by iMokhles on 11/3/13.
//  Copyright (c) 2013 iMokhles LLC. All rights reserved.
//

#import "LRNFourthViewController.h"

@interface LRNFourthViewController ()

@end

@implementation LRNFourthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[self navigationItem] setTitle:NSLocalizedString(@"About", @"")];
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 70)];
    
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(77, 0, 250, 50)];
	label.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0.0f, 1.0f);
	label.textColor = [UIColor colorWithRed:(76.0/255.0) green:(86.0/255.0) blue:(108.0/255.0) alpha:1.0f];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont boldSystemFontOfSize:17.0f];
	[header addSubview:label];
    
	label = [[UILabel alloc] initWithFrame:CGRectMake(77, 25, 250, 50)];
	label.text = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
	label.shadowColor = [UIColor whiteColor];
	label.shadowOffset = CGSizeMake(0.0f, 1.0f);
	label.textColor = [UIColor colorWithRed:(76.0/255.0) green:(86.0/255.0) blue:(108.0/255.0) alpha:1.0f];
	label.backgroundColor = [UIColor clearColor];
	label.font = [UIFont systemFontOfSize:15.0f];
	[header addSubview:label];
    
	UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 120, 120)];
	img.layer.cornerRadius = 5.0;
	img.layer.masksToBounds = YES;
	UIImage *icon = [UIImage imageNamed:@"Icon-120.png"];
    
	img.image = icon;
    
	[header addSubview:img];
    [self.tableView setTableHeaderView:header];
    
    _options = [NSArray arrayWithObjects:
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"facebookLevey.png"],@"img",@"Facebook",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"twitterLevey.png"],@"img",@"Twitter",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"googlePlusLevey.png"],@"img",@"Google+",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"youtubeLevey.png"],@"img",@"YouTube",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"iMessageLevey.png"],@"img",@"iMessage",@"text", nil],
                [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"instagramLevey.png"],@"img",@"Instagram",@"text", nil],
                
                nil];
    _optionsAmhs = [NSArray arrayWithObjects:
                    [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"twitterLevey.png"],@"img",@"Twitter",@"text", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"instagramLevey.png"],@"img",@"Instagram",@"text", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"facebookLevey.png"],@"img",@"Facebook",@"text", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"youtubeLevey.png.png"],@"img",@"YouTube",@"text", nil],
                    
                    nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    if (theCellClicked == _iMokhAbout) {
        //Do stuff
        LeveyPopListView *lplv = [[LeveyPopListView alloc] initWithTitle:NSLocalizedString(@"iMokhles Pages.....", @"FollowME Head") options:_options handler:^(NSInteger anIndex) {
            NSLog(@"You have selected %@", _options[anIndex]);
        }];
        [lplv setDelegate:self];
        [lplv setTag:1];
        [lplv showInView:self.navigationController.view animated:YES];
    }
    if (theCellClicked == _AmhsAbout) {
        LeveyPopListView *lplvAmhs = [[LeveyPopListView alloc] initWithTitle:NSLocalizedString(@"Ahmed Pages.....", @"FollowME Head") options:_optionsAmhs handler:^(NSInteger anIndex) {
            NSLog(@"You have selected %@", _options[anIndex]);
        }];
        [lplvAmhs setDelegate:self];
        [lplvAmhs setTag:2];
        [lplvAmhs showInView:self.navigationController.view animated:YES];
    }
}


#pragma mark - LeveyPopListView delegates
- (void)leveyPopListView:(LeveyPopListView *)popListView didSelectedIndex:(NSInteger)anIndex {
    NSLog(@"You have selected %@", _options[anIndex]);
    
    if (popListView.tag == 1) {
        
        switch (anIndex) {
            case 0: {
                NSLog(@"Result: Facebook");
                
                EGYModalWebViewController *myFace = [[EGYModalWebViewController alloc] initWithAddress:@"http://facebook.com/imokhles"];
                [self presentViewController:myFace animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myFacePage];
                break;
            }
            case 1: {
                NSLog(@"Result: Twitter");
                
                EGYModalWebViewController *myTweet = [[EGYModalWebViewController alloc] initWithAddress:@"http://twitter.com/imokhles"];
                [self presentViewController:myTweet animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myTweetPage];
                break;
            }
            case 2: {
                NSLog(@"Result: Google+");
                
                EGYModalWebViewController *myGoPlus = [[EGYModalWebViewController alloc] initWithAddress:@"https://plus.google.com/115238061118721422706"];
                [self presentViewController:myGoPlus animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myGooglePage];
                break;
            }
            case 3: {
                NSLog(@"Result: Youtube");
                
                EGYModalWebViewController *myTube = [[EGYModalWebViewController alloc] initWithAddress:@"http://www.youtube.com/user/MegaIphone4man"];
                [self presentViewController:myTube animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myYoutubePage];
                break;
            }
            case 4: {
                NSLog(@"Result: iMessage");
                
                NSArray *Recipient = [NSArray arrayWithObject:@"imokhles@imokhles.com"];
                
                if ([MFMessageComposeViewController canSendText]) {
                    
                    MFMessageComposeViewController *iMessageMe = [[MFMessageComposeViewController alloc] init];
                    [iMessageMe setRecipients:Recipient];
                    [iMessageMe setBody:@""];
                    [iMessageMe setMessageComposeDelegate:self];
                    
                    [self presentViewController:iMessageMe animated:YES completion:NULL];
                } else {
                    NSLog(@"Your iDevice Cannot Send This Message");
                    
                }
                //[[UIApplication alloc] openURL:myYoutubePage];
                break;
            }
            case 5: {
                NSLog(@"Result: Instagram");
                
                EGYModalWebViewController *myTube = [[EGYModalWebViewController alloc] initWithAddress:@"http://www.instagram.com/iMokhles"];
                [self presentViewController:myTube animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myYoutubePage];
                break;
            }
            default:
                NSLog(@"Result: not sent");
                break;
        }
    } if (popListView.tag == 2) {
        switch (anIndex) {
            case 0: {
                NSLog(@"Result: Twitter");
                
                EGYModalWebViewController *amTweet = [[EGYModalWebViewController alloc] initWithAddress:@"http://twitter.com/Amhs221"];
                [self presentViewController:amTweet animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myFacePage];
                break;
            }
            case 1: {
                NSLog(@"Result: Instagram");
                
                EGYModalWebViewController *amIng = [[EGYModalWebViewController alloc] initWithAddress:@"http://instagram.com/Amhs221"];
                [self presentViewController:amIng animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myTweetPage];
                break;
            }
            case 3: {
                NSLog(@"Result: Facebook");
                
                EGYModalWebViewController *amFace = [[EGYModalWebViewController alloc] initWithAddress:@"https://www.facebook.com/medocracker"];
                [self presentViewController:amFace animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myTweetPage];
                break;
            }
            case 4: {
                NSLog(@"Result: Youtube");
                
                EGYModalWebViewController *amTube = [[EGYModalWebViewController alloc] initWithAddress:@"http://www.youtube.com/user/MMr212m"];
                [self presentViewController:amTube animated:YES completion:NULL];
                
                //[[UIApplication alloc] openURL:myTweetPage];
                break;
            }
        }
    }
    
}

#pragma mark - MFMailComposeViewController delegates
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Result: saved");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - MessageComposeViewController delegates
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    switch (result)
    {
        case MessageComposeResultCancelled:
            NSLog(@"Result: canceled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Result: sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Result: failed");
            break;
        default:
            NSLog(@"Result: not sent");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end

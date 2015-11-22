//
//  SPWebViewController.h
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView * webView;
@property (strong, nonatomic) NSURL * bankURL;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *actInd;

@end
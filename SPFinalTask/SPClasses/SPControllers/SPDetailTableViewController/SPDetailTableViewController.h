//
//  SPDetailTableViewController.h
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPBank.h"

@interface SPDetailTableViewController : UITableViewController

@property (strong, nonatomic) SPBank * currentBank;

@end
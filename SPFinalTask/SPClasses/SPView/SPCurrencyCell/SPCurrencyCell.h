//
//  SPCurrencyCell.h
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPCurrencyCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * currencyLabel;
@property (weak, nonatomic) IBOutlet UILabel * bidLabel;
@property (weak, nonatomic) IBOutlet UILabel * askLabel;

@end
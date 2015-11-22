//
//  SPBankDetailsCell.h
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPBankDetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * bankNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankRegionLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *bankPhoneNumLabel;

@end
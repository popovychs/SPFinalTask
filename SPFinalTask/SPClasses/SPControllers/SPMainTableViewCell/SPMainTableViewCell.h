//
//  SPMainTableViewCell.h
//  SPFinalTask
//
//  Created by popovychs on 21.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SPMainTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel * mainCellBankNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * mainCellRegionNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * mainCellCityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel * mainCellPhoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel * mainCellAddressLabel;

@property (weak, nonatomic) IBOutlet UIButton *mainCellLinkButton;
@property (weak, nonatomic) IBOutlet UIButton *mainCellMapButton;
@property (weak, nonatomic) IBOutlet UIButton *mainCellPhoneButton;
@property (weak, nonatomic) IBOutlet UIButton *mainCellDetailButton;

@end
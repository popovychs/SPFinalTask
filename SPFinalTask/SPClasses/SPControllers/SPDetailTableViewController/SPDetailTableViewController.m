//
//  SPDetailTableViewController.m
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPDetailTableViewController.h"
#import "SPBankDetailsCell.h"
#import "SPCurrencyDescriptionCell.h"
#import "SPCurrencyCell.h"
#import "SPCurrency.h"

@interface SPDetailTableViewController ()

@property (strong, nonatomic) NSArray * currensiesArray;

@end

@implementation SPDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currensiesArray = [[self.currentBank currency] allObjects];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return [self.currensiesArray count];
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
    SPBankDetailsCell * cell1 = [tableView dequeueReusableCellWithIdentifier:@"detailCell1" forIndexPath:indexPath];
        cell1.bankNameLabel.text = self.currentBank.name;
        cell1.bankLinkLabel.text = self.currentBank.link;
        cell1.bankRegionLabel.text = self.currentBank.region;
        cell1.bankCityLabel.text = self.currentBank.city;
        cell1.bankAddressLabel.text = self.currentBank.address;
        cell1.bankPhoneNumLabel.text = self.currentBank.phone;
        
        return cell1;
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        SPCurrencyDescriptionCell * cell2 = [tableView dequeueReusableCellWithIdentifier:@"detailCell2" forIndexPath:indexPath];
        return cell2;
    }
    
    if (indexPath.section == 2) {
        SPCurrencyCell * cell3 = [tableView dequeueReusableCellWithIdentifier:@"detailCell3" forIndexPath:indexPath];
        
        SPCurrency * currency = self.currensiesArray[indexPath.row];
        cell3.currencyLabel.text = currency.currencyName;
        cell3.bidLabel.text = currency.bid;
        cell3.askLabel.text = currency.ask;
        
        return cell3;
    }
    return nil;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

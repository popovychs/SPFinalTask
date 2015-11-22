//
//  SPMainTableViewController.m
//  SPFinalTask
//
//  Created by popovychs on 21.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPMainTableViewController.h"
#import "SPCoreData.h"
#import "SPBank+CoreDataProperties.h"
#import "SPMainTableViewCell.h"

static NSString * const SPMainTableViewCellIdentefier = @"bankCell";

@interface SPMainTableViewController ()

@property (strong, nonatomic) NSMutableArray * arrayOfBanks;

@property (strong, nonatomic) UISearchBar * searchBar;
@property (strong, nonatomic) UISearchController * searchController;

@end

@implementation SPMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Converter Lab";
    
    //searchBar
    UIBarButtonItem * searchButton = [[UIBarButtonItem alloc]
                                      initWithImage: [UIImage imageNamed:@"ic_search"]
                                      style:UIBarButtonItemStylePlain
                                      target:self
                                      action:@selector(searchButtonPressed)];
    self.navigationItem.rightBarButtonItem = searchButton;
    [self addSearchBar];
    
    [self downloadBankInfo];
    [self updateBankData];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayOfBanks.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:SPMainTableViewCellIdentefier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[SPMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SPMainTableViewCellIdentefier];
    }
    
    [self settingUpCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void) settingUpCell:(SPMainTableViewCell *)cell atIndexPath:(NSIndexPath *) indexPath
{
    SPBank * bank = [self.arrayOfBanks objectAtIndex:indexPath.section];
    cell.mainCellBankNameLabel.text = bank.name;
    cell.mainCellRegionNameLabel.text = bank.region;
    cell.mainCellCityNameLabel.text = bank.city;
    cell.mainCellPhoneNumberLabel.text = bank.phone;
    cell.mainCellAddressLabel.text = bank.address;
    
    cell.mainCellLinkButton.tag = indexPath.section;
    cell.mainCellMapButton.tag = indexPath.section;
    cell.mainCellPhoneButton.tag = indexPath.section;
    cell.mainCellDetailButton.tag = indexPath.section;
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

#pragma mark - UISearchBar configuratin

-(void)addSearchBar
{
    self.searchBar = [[UISearchBar alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.tintColor = [UIColor whiteColor];
}

- (void)searchButtonPressed {
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.active = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.tableView.tableHeaderView = nil;
    self.searchController.searchBar.text = nil;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self updateBankData];
    [self.tableView reloadData];
}

#pragma mark - CoreData managment

- (void) updateBankData
{
    [self updateArrayOfBanks];
    [self sortArrayOfBanks];
}

- (void) updateArrayOfBanks
{
    SPCoreData * coreDataManager = [SPCoreData sharedInstance];
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Bank"];
    self.arrayOfBanks = [[coreDataManager.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
}

- (void) sortArrayOfBanks
{
    NSSortDescriptor * bankSortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    NSArray * sortDescriptors = [NSArray arrayWithObject:bankSortDescriptor];
    NSArray * sortedBanks = [self.arrayOfBanks sortedArrayUsingDescriptors:sortDescriptors];
    self.arrayOfBanks = [sortedBanks mutableCopy];
}

- (void) deleteOldDataOfBanksInDB
{
    SPCoreData * coreDataManager = [SPCoreData sharedInstance];
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Bank"];
    self.arrayOfBanks = [[coreDataManager.managedObjectContext executeFetchRequest:request error:nil]mutableCopy];
    
    for (SPBank * bank in self.arrayOfBanks) {
        [coreDataManager.managedObjectContext deleteObject:bank];
    }
    
    NSError * error = nil;
    if (![coreDataManager.managedObjectContext save:&error]) {
        NSLog(@"Can't delete data: %@ %@",error, [error localizedDescription]);
    }
}

#pragma mark - Download Bank Info

- (NSURLSessionConfiguration *) configureSession
{
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 30.0f;
    configuration.timeoutIntervalForResource = 60.0f;
    return configuration;
}

- (void) downloadBankInfo
{
    NSURL * resourseURL =
    [NSURL URLWithString:@"http://resources.finance.ua/ua/public/currency-cash.json"];
    NSURLSession * session = [NSURLSession sessionWithConfiguration: [self configureSession]];
    
    NSURLSessionTask * getDataForURLTask =
    [session dataTaskWithURL:resourseURL
           completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
               
               if ([response respondsToSelector:@selector(statusCode)])
               {
                   if ([(NSHTTPURLResponse *) response statusCode] == 200)
                   {
                       NSDictionary *jsonDictionary =
                       [self createDictionaryFromData:data];
                       
                       if (jsonDictionary)
                       {
                           [self deleteOldDataOfBanksInDB];
                           [self createDataBaseFromDictionary:jsonDictionary];
                       }
                   } else {
                       
                       dispatch_async(dispatch_get_main_queue(), ^{
                           //[self removeLoadingInProgressLable];
                           UIAlertView * alert =
                           [[UIAlertView alloc] initWithTitle:@"Downloading failed"
                                                      message:@"Information is NOT updated!"
                                                     delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                           [alert show];
                       });
                   }
               }
           }];
    
    [getDataForURLTask resume];
}

- (NSDictionary*)createDictionaryFromData: (NSData*) data
{
    NSError *parseJsonError = nil;
    
    NSDictionary *jsonDict =
    [NSJSONSerialization JSONObjectWithData:data
                                    options:NSJSONReadingAllowFragments
                                      error:&parseJsonError];
    if (!parseJsonError)
    {
        return jsonDict;
    }
    return nil;
}

- (void)createDataBaseFromDictionary: (NSDictionary*)jsonDictionary
{
    [self createBanksArray:jsonDictionary];
    
    [self updateBankData];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        //[self removeLoadingInProgressLable];
        [self.tableView reloadData];
    });
}

- (void)createBanksArray: (NSDictionary*)jsonDictionary
{
    SPCoreData * coreDataManager = [SPCoreData sharedInstance];
    
    NSArray * allOrganizations = jsonDictionary[@"organizations"];
    
    for (NSDictionary * organization in allOrganizations) {
        
        if ([organization[@"orgType"] integerValue] == 1) {
            SPBank * bankObject =
            [NSEntityDescription insertNewObjectForEntityForName:@"Bank"
                                          inManagedObjectContext:
             coreDataManager.managedObjectContext];
            
            bankObject.name = organization[@"title"];
            bankObject.address = organization[@"address"];
            bankObject.region = organization[@"region"];
            bankObject.city = organization[@"city"];
            bankObject.phone = organization[@"phone"];
            
//            [self createCurrencyExchangeRatesForBank:bankObject
//                                     usingDictionary:organization];
//            
//            [self setRelationshipsForBank: bankObject
//                          usingDictionary: organization];
        }
    }
    
    NSError * error = nil;
    if (![coreDataManager.managedObjectContext save:&error])
    {
        NSLog(@"Can't save banks array - %@ %@", error, [error localizedDescription]);
    }
}

@end
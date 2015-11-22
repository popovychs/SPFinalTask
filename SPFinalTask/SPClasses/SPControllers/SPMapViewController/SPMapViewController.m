//
//  SPMapViewController.m
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import "SPMapViewController.h"

@interface SPMapViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *bankLocationMapView;
@property (assign, nonatomic) CLLocationCoordinate2D bankCoordinates;

@end

@implementation SPMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * addressOfBank = [NSString stringWithFormat:@"%@, %@, %@",self.bank.city, self.bank.region, self.bank.address];
    
    [self setAddress:addressOfBank];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setAddress:(NSString *)address
{
    CLGeocoder * geocoder = [CLGeocoder new];
    
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            CLPlacemark * placemark = [placemarks objectAtIndex:0];
            CLLocation * location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            self.bankCoordinates = coordinate;
        } else {
            [self showAlertWithTitle:@"Error" message:@"Can't view map"];
        }
    }];
}

-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message{
    [[[UIAlertView alloc]
      initWithTitle:title
      message:message
      delegate:nil
      cancelButtonTitle:@"OK"
      otherButtonTitles:nil]show];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
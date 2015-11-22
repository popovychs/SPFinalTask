//
//  SPMapViewController.h
//  SPFinalTask
//
//  Created by popovychs on 22.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SPBank.h"

@interface SPMapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) SPBank * bank;

@end
//
//  SPBank+CoreDataProperties.h
//  SPFinalTask
//
//  Created by popovychs on 21.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SPBank.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPBank (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *region;
@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *phone;
@property (nullable, nonatomic, retain) NSString *address;

@end

NS_ASSUME_NONNULL_END

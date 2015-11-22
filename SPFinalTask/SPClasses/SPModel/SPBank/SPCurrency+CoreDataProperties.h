//
//  SPCurrency+CoreDataProperties.h
//  SPFinalTask
//
//  Created by popovychs on 23.11.15.
//  Copyright © 2015 popovychs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SPCurrency.h"

NS_ASSUME_NONNULL_BEGIN

@interface SPCurrency (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *currencyName;
@property (nullable, nonatomic, retain) NSString *bid;
@property (nullable, nonatomic, retain) NSString *ask;
@property (nullable, nonatomic, retain) SPBank *bank;

@end

NS_ASSUME_NONNULL_END

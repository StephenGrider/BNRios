//
//  BNRItemStore.h
//  Homepwner
//
//  Created by stephen g on 3/6/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allItems;

+(instancetype)sharedStore;
-(BNRItem *) createItem;
-(void)removeItem:(BNRItem *)item;
-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;


@end


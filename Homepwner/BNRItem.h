//
//  BNRItem.h
//  RandomItems
//
//  Created by stephen g on 2/25/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+(instancetype)randomItem;

@property (nonatomic, copy) NSString *itemKey;
@property (copy, nonatomic) NSString *itemName;
@property (copy, nonatomic) NSString *serialNumber;
@property int valueInDollars;
@property (strong, readonly, nonatomic) NSDate *dateCreated;

//designated initializer
-(instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;
-(instancetype)initWithItemName:(NSString *)name;
-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;


@end

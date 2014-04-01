//
//  BNRItemStore.m
//  Homepwner
//
//  Created by stephen g on 3/6/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRImageStore.h"

@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end


@implementation BNRItemStore

-(void)removeItem:(BNRItem *)item{
    NSString *key = item.itemKey;
    [[BNRImageStore sharedStore] deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}

+(instancetype)sharedStore{
    static BNRItemStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRItemStore sharedStore]" userInfo:nil];
    
    return nil;
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSArray *) allItems{
    return self.privateItems;
}

-(BNRItem *)createItem{
    BNRItem *item = [BNRItem randomItem];
    [self.privateItems addObject:item];
    return item;
}

-(void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex{
    if(fromIndex == toIndex){
        return;
    }
    BNRItem *item = self.privateItems[fromIndex];
    
    [self.privateItems removeObjectIdenticalTo:item];
    [self.privateItems insertObject:item atIndex:toIndex];
}



@end

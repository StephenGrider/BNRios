//
//  BNRImageStore.m
//  Homepwner
//
//  Created by stephen g on 3/11/14.
//  Copyright (c) 2014 stephen g. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation BNRImageStore

+(instancetype)sharedStore{
    static BNRImageStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc] init];
    }
    return sharedStore;
}

-(instancetype)init{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +[BNRImageStore sharedStore]" userInfo:nil];
    return nil;
}

-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setImage:(UIImage *)image forKey:(NSString *)key{
    [self.dictionary setObject:image forKey:key];
}

-(UIImage *)imageForKey:(NSString *)key{
    return [self.dictionary objectForKey:key];
}

-(void)deleteImageForKey:(NSString *)key{
    if(!key){
        return;
    }
    [self.dictionary removeObjectForKey:key];
}













@end

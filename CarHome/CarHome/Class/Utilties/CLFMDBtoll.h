//
//  CLFMDBtoll.h
//  CarHome
//
//  Created by Aspmcll on 16/3/1.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface CLFMDBtoll : NSObject
+(FMDatabase *)sharedDatabase;

@end

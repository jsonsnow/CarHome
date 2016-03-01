//
//  SQLInterface.h
//  CarHome
//
//  Created by Aspmcll on 16/3/1.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SQLInterface <NSObject>
@optional
-(BOOL)saveData;
-(void)loadData;
-(BOOL)deleteData;
-(BOOL)updateData;

@end

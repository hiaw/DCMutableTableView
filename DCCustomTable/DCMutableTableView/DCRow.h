//
//  DCRow.h
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DCRow : NSObject {
    UITableViewCell *cell;
    NSString *command;
}

@property (retain, readwrite) UITableViewCell *cell;
@property (retain, readwrite) NSString *command;

@end

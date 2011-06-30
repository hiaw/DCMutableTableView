//
//  DCSection.h
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCRow.h"

@interface DCSection : NSObject {
    NSMutableArray *arrayOfRows;
    NSString *headerString;
    NSString *footerString;
}

@property (retain, readwrite) NSMutableArray *arrayOfRows;
@property (retain, readwrite) NSString *headerString;
@property (retain, readwrite) NSString *footerString;

@end

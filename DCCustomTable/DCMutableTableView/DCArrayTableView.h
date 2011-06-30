//
//  DCTableArray.h
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCSection.h"
#import "DCRow.h"

@interface DCArrayTableView : UITableView {
    NSMutableArray *arrayOfSections;
}

@property (retain, readwrite) NSMutableArray *arrayOfSections;

@end

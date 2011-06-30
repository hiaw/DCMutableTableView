//
//  RootViewController.h
//  DCCustomTable
//
//  Created by Daniel Chong on 29/6/11.
//  Copyright 2011 Stillpig.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCArrayTableView.h"

@interface RootViewController : DCArrayTableView {

    IBOutlet UITableViewCell *syncNowCell;
    IBOutlet UITableViewCell *syncingCell;
    IBOutlet UITableViewCell *dropboxUserName;
    IBOutlet UITableViewCell *dropboxPasswordCell;
    IBOutlet UITableViewCell *syncOptionCell;
    IBOutlet UITableViewCell *removeAdCell;
    IBOutlet UITableViewCell *FAQCell;
    IBOutlet UITableViewCell *DonateCell;
}


@end

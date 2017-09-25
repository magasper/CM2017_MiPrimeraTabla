//
//  NewPerson.h
//  Mi Primera Tabla
//
//  Created by pegasus on 25/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol addPersonalDelegate <NSObject>
@optional
- (void)personalName: (NSString*) name personalAge: (NSString*) age personalImage: (UIImage *) image;
@end

@interface NewPerson : UIViewController
@property (nonatomic, weak) id <addPersonalDelegate> delegate;
@end


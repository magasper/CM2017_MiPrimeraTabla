//
//  DetailPerson.m
//  Mi Primera Tabla
//
//  Created by pegasus on 26/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "DetailPerson.h"

@interface DetailPerson ()
@property (strong, nonatomic) IBOutlet UIImageView *imagePersonal;
@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblAge;
@property (strong, nonatomic) IBOutlet UILabel *lblDescription;

@end

@implementation DetailPerson

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.person != nil) {
        self.imagePersonal.image = self.person[@"image"];
        self.lblName.text = self.person[@"name"];
        self.lblDescription.text = self.person[@"description"];
        self.lblAge.text = self.person[@"age"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

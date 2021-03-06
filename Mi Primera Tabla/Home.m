//
//  ViewController.m
//  Mi Primera Tabla
//
//  Created by Walter Gonzalez Domenzain on 20/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "Home.h"
#import "cellMainTable.h"
#import "NewPerson.h"
#import "DetailPerson.h"

@interface Home () <addPersonalDelegate>
@property NSMutableArray *userNames;
@property NSMutableArray *userAges;
@property NSMutableArray *userImages;

@property NSMutableArray *informationPerson;
@end

@implementation Home
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-------------------------------------------------------------------------------
- (void)initController {
    self.informationPerson = [[NSMutableArray alloc]init];
    [self.informationPerson addObject:@{
                                 @"name" :  @"Tyrion Lannister",
                                 @"age" : @"38 años",
                                 @"image" :  [UIImage imageNamed:@"tyrion.jpg"],
                                 @"description": @"Hombre de 38 años"
                                 }];
    [self.informationPerson addObject: @{
                                  @"name" :  @"Daenerys Targaryen",
                                  @"age" : @"22 años",
                                  @"image" :  [UIImage imageNamed:@"daenerys.jpeg"],
                                  @"description": @"Mujer de 22 años"
                                  }];
    [self.informationPerson addObject: @{
                                  @"name" :  @"Jon Snow",
                                  @"age" : @"25 años",
                                  @"image" :  [UIImage imageNamed:@"jon.jpg"],
                                  @"description": @"Hombre de 25 años"
                                  }];
    [self.informationPerson addObject: @{
                                  @"name" :  @"Arya Stark",
                                  @"age" : @"16 años",
                                  @"image" :  [UIImage imageNamed:@"arya.jpg"],
                                  @"description": @"Mujer de 16 años"
                                  }];
    [self.informationPerson addObject:@{
                                 @"name" :  @"Cersei Lannister",
                                 @"age" : @"42 años",
                                 @"image" :  [UIImage imageNamed:@"cersei.jpg"],
                                 @"description": @"Mujer de 42 años"
                                 }];
    
    
    /*self.userNames  = [[NSMutableArray alloc] initWithObjects: @"Tyrion Lannister", @"Daenerys Targaryen", @"Jon Snow", @"Arya Stark", @"Cersei Lannister", nil];
    
    self.userAges  = [[NSMutableArray alloc] initWithObjects: @"38 años", @"22 años", @"25 años", @"16 años", @"42 años", nil];

    self.userImages = [[NSMutableArray alloc] initWithObjects: [UIImage imageNamed:@"tyrion.jpg"], [UIImage imageNamed:@"daenerys.jpeg" ], [UIImage imageNamed:@"jon.jpg"], [UIImage imageNamed:@"arya.jpg"], [UIImage imageNamed:@"cersei.jpg"], nil];*/
}

/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.informationPerson.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Initialize cells
    cellMainTable *cell = (cellMainTable *)[tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellMainTable" bundle:nil] forCellReuseIdentifier:@"cellMainTable"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellMainTable"];
    }
    
    NSDictionary *data = self.informationPerson[indexPath.row];
    //Fill cell with info from arrays
    cell.lblName.text       = data[@"name"];
    cell.lblAge.text        = data[@"age"];
    cell.imgUser.image      = data[@"image"];
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //Pending
    
    [self.tblMain deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *current = self.informationPerson[indexPath.row];
    [self performSegueWithIdentifier:@"showDetail" sender:current];
}
/**********************************************************************************************/
#pragma mark - Action methods
/**********************************************************************************************/
- (IBAction)btnAddPressed:(id)sender {
    [self performSegueWithIdentifier:@"addPersonal" sender:nil];
    
    //[self.userNames addObject:@"Walter"];
    //[self.userAges addObject:@"37 años"];
    //[self.userImages addObject:@"jon.jpg"];
    //[self.tblMain reloadData];
}

- (void)personalName: (NSString*) name personalAge: (NSString*) age personalImage: (UIImage *) image{
    NSLog(@"Listo para pintar");
    
    [self.informationPerson addObject:@{
                                 @"name" :  name,
                                 @"age" : age,
                                 @"image" :  image,
                                 @"description": @""
                                 }];
    [self.tblMain reloadData];
    
    /*[self.userNames addObject:name];
    [self.userAges addObject: age];
    [self.userImages addObject:image];
    [self.tblMain reloadData];*/

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"addPersonal"]) {
        NewPerson *person = [segue destinationViewController];
        
        person.delegate = self;
    }else if ([segue.identifier isEqualToString:@"showDetail"]){
        DetailPerson *detailPerson = [segue destinationViewController];
        detailPerson.person = sender;
    
    }

    
}


@end

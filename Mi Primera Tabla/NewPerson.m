//
//  NewPerson.m
//  Mi Primera Tabla
//
//  Created by pegasus on 25/09/17.
//  Copyright © 2017 wgdomenzain. All rights reserved.
//

#import "NewPerson.h"

@interface NewPerson () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtAge;
@property (strong, nonatomic) IBOutlet UIImageView *imageSelection;

@end

@implementation NewPerson

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnAdd:(id)sender {
    
    NSLog(@"Le dio guardar");
    if (self.delegate != nil) {
        
        [self.delegate personalName:self.txtName.text personalAge:self.txtAge.text personalImage:self.imageSelection.image];
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
- (void)takePicture {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)selectPhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)btnActionPic:(UITapGestureRecognizer *)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Selecciona una opción" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *selfie = [UIAlertAction actionWithTitle:@"Tomar selfie" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"TomarSelfie");
        [self takePicture];
    }];
    
    UIAlertAction *gallery = [UIAlertAction actionWithTitle:@"Seleccionar foto" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Seleccionar foto");
        [self selectPhoto];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:selfie];
    [alert addAction:gallery];
    [alert addAction:cancel];
    [self presentViewController:alert animated:true completion:nil];
    
    
}
#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *choosenImage = info[UIImagePickerControllerEditedImage];
    self.imageSelection.image = choosenImage;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end

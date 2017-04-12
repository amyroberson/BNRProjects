//
//  ViewController.m
//  Contacts
//
//  Created by Amy Roberson on 4/10/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

#import "ContactsViewController.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if (self) {
        
        _contacts =[NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

-(IBAction)cancelToContactsViewController:(UIStoryboardSegue *)segue
{
    // takes no action when cancel is pressed
}

-(IBAction)createNewContact: (UIStoryboardSegue *)seque
{
    NewContactViewController *newContactVC = seque.sourceViewController;
    NSString *firstname = newContactVC.firstNameTextField.text;
    NSString *lastname = newContactVC.LastNameTextField.text;
    if (firstname.length != 0 || lastname.length != 0) {
        NSString *name = [NSString stringWithFormat:@"%@ %@", firstname, lastname];
        Contact *newContact = [[Contact alloc] initWithName:name];
        [self.contacts addObject: newContact];
        [self.tableView reloadData];
    }
}


@end

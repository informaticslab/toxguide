//
//  SubstanceViewController.m
//  mobiletox
//
//
//  Copyright 2011  U.S. Centers for Disease Control and Prevention
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software 
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//


#import "SubstanceViewController.h"
#import "SubstanceSectionsController.h"
#import "DataController.h"
#import "ToxDoc.h"
#import "AppManager.h"
#import "EulaViewController.h"

@implementation SubstanceViewController
@synthesize substanceSectionsController;
@synthesize dataController;


AppManager *appMgr;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {

	self.title = @"Substances";
	    
	// create the data controller if not already done
	if (self.dataController == nil)
	{
		DataController *controller = [[DataController alloc] init];
		self.dataController = controller;
		[controller release];
	}
	[super viewDidLoad];

}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self presentEulaModalView];
    
    
}

- (void)didDismissModalView {
    
    // Dismiss the modal view controller
    [self dismissModalViewControllerAnimated:YES];
    
}

- (void)presentEulaModalView
{
    
    if (appMgr.agreedWithEula == TRUE)
        return;
    
    // store the data
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *currVersion = [NSString stringWithFormat:@"%@.%@", 
                             [appInfo objectForKey:@"CFBundleShortVersionString"], 
                             [appInfo objectForKey:@"CFBundleVersion"]];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersionEulaAgreed = (NSString *)[defaults objectForKey:@"agreedToEulaForVersion"];
    
    
    // was the version number the last time EULA was seen and agreed to the 
    // same as the current version, if not show EULA and store the version number
    if (![currVersion isEqualToString:lastVersionEulaAgreed]) {
        [defaults setObject:currVersion forKey:@"agreedToEulaForVersion"];
        [defaults synchronize];
        NSLog(@"Data saved");
        NSLog(@"%@", currVersion);
        
        // Create the modal view controller
        EulaViewController *eulaVC = [[EulaViewController alloc] initWithNibName:@"EulaViewController" bundle:nil];
        
        // we are the delegate that is responsible for dismissing the help view
        eulaVC.delegate = self;
        eulaVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentModalViewController:eulaVC animated:YES];
        
    }
    
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataController countOfList];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...
	// Get the object to display and set the value in the cell.
    ToxDoc *toxDocAtIndex = [dataController objectInListAtIndex:indexPath.row];
    cell.textLabel.text = toxDocAtIndex.title;

    return cell;
	
}

#pragma mark -
#pragma mark Table view selection

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	// navigation logic:
	// create and push another view controller
	// create the data controller if not already done
	if (substanceSectionsController != nil) {
		[substanceSectionsController release];
		substanceSectionsController = nil;
	}

	if (substanceSectionsController == nil) {
		substanceSectionsController = [[SubstanceSectionsController alloc] initWithStyle:UITableViewStylePlain];
		substanceSectionsController.dataController = self.dataController;
	}
	
	ToxDoc *toxDocAtIndex = [dataController objectInListAtIndex:indexPath.row];
	substanceSectionsController.title = toxDocAtIndex.title;
	substanceSectionsController.toxDoc = toxDocAtIndex;
	
	NSLog(@"self.navigationController = address %@", self.navigationController);

    [self.navigationController pushViewController:substanceSectionsController
                                         animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [super dealloc];
}


@end


//
//  SubstanceSectionsController.m
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


#import "SubstanceSectionsController.h"
#import "SubstanceDetailController.h"
#import "DataController.h"
#import "ToxDoc.h"
#import "ToxDocSection.h"

@implementation SubstanceSectionsController

@synthesize list, dataController, toxDoc;
- (void)viewDidLoad {
    self.list = toxDoc.sections;
    [super viewDidLoad];
}
- (void)viewDidUnload {
    self.list = nil;
    [childController release];
    childController = nil;
}

- (void)dealloc {
    [list release];
    [childController release];
    [super dealloc];
}


#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section {
    return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * substanceSectionCellIdentifier = 
    @"SubstanceSectionCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: 
                             substanceSectionCellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                       reuseIdentifier: substanceSectionCellIdentifier]
                autorelease];
    }
    NSUInteger row = [indexPath row];
    ToxDocSection *toxDocSection = [list objectAtIndex:row];
    cell.textLabel.text = toxDocSection.title;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
  //  [toxDocSection release];
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods


- (void)tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:
//                          @"Hey, do you see the disclosure button?" 
//                                                    message:@"If you're trying to drill down, touch that instead"
//                                                   delegate:nil 
//                                          cancelButtonTitle:@"Won't happen again" 
//                                          otherButtonTitles:nil];
//    [alert show];
//    [alert release];
  
	[self tableView:tableView accessoryButtonTappedForRowWithIndexPath:indexPath];
}
- (void)tableView:(UITableView *)tableView 
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (childController != nil) {
        [childController release];
        childController = nil;
    }
    
    if (childController == nil)
        childController = [[SubstanceDetailController alloc] 
                           initWithNibName:@"SubstanceDetailView" bundle:nil];
    
    childController.title = @"Substance Detail";
    NSUInteger row = [indexPath row];
    	
    childController.toxDocSection = [list objectAtIndex:row];
	
    [self.navigationController pushViewController:childController
										 animated:YES];

}


@end

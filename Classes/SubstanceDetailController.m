//
//  SubstanceDetailController.m
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


#import "SubstanceDetailController.h"
#import "ToxDocSection.h"

@implementation SubstanceDetailController

@synthesize text, textView, toxDocSection;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    textView.text = toxDocSection.contents;
	textView.font = [UIFont fontWithName:@"Arial" size:18.0f];
	textView.editable = FALSE;
    self.title = toxDocSection.title;
    [super viewDidLoad];
}
- (void)viewDidUnload {
//    self.list = nil;
//    [childController release];
//    childController = nil;
}

- (void)dealloc {
 //   [list release];
//    [childController release];
    [super dealloc];
}


- (void) setText:(NSString *)theText
{
    self.textView.text = theText;
}

@end

//
//     File: DataController.m
//    Abstract: A simple controller class responsible for managing the application's data.
// 
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


#import "DataController.h"
#import "ToxDoc.h"



@interface DataController ()
@property (nonatomic, copy, readwrite) NSMutableArray *list;
- (void)createDemoData;
@end


@implementation DataController

@synthesize list;


- (id)init {
    if (self = [super init]) {
        [self createDemoData];
    }
    return self;
}

// Custom set accessor to ensure the new list is mutable
- (void)setList:(NSMutableArray *)newList {
    if (list != newList) {
        [list release];
        list = [newList mutableCopy];
    }
}

// Accessor methods for list
- (unsigned)countOfList {
    return [list count];
}

- (ToxDoc *)objectInListAtIndex:(unsigned)theIndex {
    return [list objectAtIndex:theIndex];
}


- (void)dealloc {
    [list release];
    [super dealloc];
}


- (void)createDemoData {
    
    /*
     Create an array containing some demonstration data.
     */
    
    NSMutableArray *substanceList = [[NSMutableArray alloc] init];
    ToxDoc *toxDoc;
    
	toxDoc = [[ToxDoc alloc] init];
	toxDoc.title = @"Aluminum (full)";
	
	// Aluminum Chemical Info (done)
	[toxDoc addSection:@"\u2022 Aluminum is a metal"
	 "\n" "\n"
	 "\u2022 Aluminum is a silvery-white metal. In nature it is found in most rocks, particularly igneous rocks as aluminosilicate minerals."
      "\n"
	 "\n\u2022 Because of its high reactivity, aluminum does not exist as the metal in the environment; it exists in a combined state with other elements."
      "\n"
	 "\n\u2022 Aluminum metal is used to make beverage cans, pots and pans, automotive components, siding and roofing, and foil."
      "\n"
	 "\n\u2022 Aluminum compounds are used in water treatment, abrasives, and furnace linings. Powdered aluminum metal is used in explosives and fireworks."
	 "\n"
     "\n\u2022 Aluminum compounds are found in consumer products such as foil and antiperspirants, over the counter and prescription drugs such as antacids, buffered aspirin, and antiulceratives, and in food additives." withTitle:@"Chemical & Physical Info"];
	
	
	//Sources of Exposure goes here (done)
	[toxDoc addSection:@
	 "General Populations"
	 "\n"
	 "\n\u2022 Aluminum is ubiquitous in the environment. For the general population, exposure to aluminum most likely occurs through the consumption of food, water, and aluminum containing medicinals, such as antacids, buffered analgesics, antidiarrheal agents, or antiulcerative medication."
	"\n"
	 "\n\u2022 Inhalation exposure and dermal contact may also contribute a small amount to an individual’s daily aluminum exposure."
	 "\n"
	"\n Occupational Populations"
	 "\n"
	"\n\u2022 Potential for exposure during the refining of the primary metal and in secondary industries that fabricate aluminum products (such as aircraft, automotive, and metal products) and aluminum welding." withTitle:@"Sources of Exposure"];	
	
	
	// Aluminum Routes of Exposure (done)
	[toxDoc addSection:@"\u2022 Inhalation – generally limited to occupational exposure."
	 "\n"
	 "\n\u2022 Oral – primary route of exposure for the general population. Aluminum is found in food, drinking water, and medicinal products such as antacids and buffered aspirin."
	 "\n"
	 "\n\u2022 Dermal (skin) contact—minor route of exposure; aluminum is found in some topically applied consumer products such as antiperspirants, first aid antibiotics, and sunscreen and suntan products." withTitle:@"Routes of Exposure"];
	
	//Normal Human Levels goes here (done)
	[toxDoc addSection:@"Normal Human Levels"
	"\n" 
	"\n\u2022 The total body burden of aluminum in healthy individuals is 30 to 50 mg."
	"\n" 
	 "\n\u2022 Approximately 50% of the body burden is in the skeleton and 25% is in the lungs."
	"\n" 
	 "\n\u2022 Aluminum levels in lungs increase with age."
	"\n" 
	 "\n\u2022 Aluminum levels in bone tissue of healthy individuals range from 5 to 10 mg/kg."
	"\n" 
	"\n\u2022 Serum levels in healthy individuals range from 1-3 μg/L." withTitle:@"Normal Human Levels"];	
	
	
	// Aluminum Health Effects (done)
	[toxDoc addSection:@"**Health effects are determined by the dose (how much), the duration (how long), and the route of exposure**"
	 "\n"
	 "\n"
	 "Minimal Risk Levels (MRLs)"
	 "\n" 
	 "\n Inhalation"
	 "\n" 
	 "\n\u2022 No acute-, intermediate-, or chronic- duration inhalation MRLs were derived for aluminum"
	 "\n" 
	 "\n Oral"
	 "\n" 
	 "\n\u2022 An acute-duration oral MRL was not derived for aluminum."
	 "\n" 
	 "\n\u2022 An MRL of 1 mg aluminum/kg/day has been derived for intermediate-duration oral exposure (15-364 days)."
	 "\n" 
	 "\n\u2022 An MRL of 1 mg aluminum/kg/day has been derived for chronic-duration oral exposure (365 days or more)."
	 "\n" 
	 "\n Health Effects"
	 "\n" 
	 "\n\u2022 The most sensitive target of aluminum toxicity is the nervous system. Impaired performance on neurobehavioral tests of motor function, sensory function, and cognitive function have been observed in animals. Neurobehavioral alterations have been observed following exposure of adult or weanling animals and in animals exposed during gestation and/or lactation."
	"\n" 
	 "\n\u2022 Respiratory effects, such as impaired lung function and fibrosis have been observed in aluminum workers."
	 "\n" 
	 "\n\nChildren’s Health"
	"\n" 
	 "\n\u2022 Children who are exposed to high levels of aluminum exhibit symptoms similar to those seen in adults, including neurological effects and skeletal effects."
	"\n" 
	 "\n\u2022 We do not know if children are more susceptible than adults to aluminum toxicity." withTitle:@"Health Effects (Pub Health)"];	
	
	
	//Aluminium in the Environment (and Environmental Levels)
	[toxDoc addSection:@"Aluminum in the Environment"
	 "\n"
	 "\n\u2022 Aluminum is the most abundant metal in the earth’s crust."
	 "\n"
	 "\n\u2022 High levels in the environment can be part of the natural deposits in the earth or caused by the mining and processing of its ores and by production of aluminum metal, alloys, and compounds."
	 "\n"
	 "\n\u2022 Aluminum cannot be destroyed in the environment. It can only change its form or become attached to or separated from particles."
	 "\n"
	 "\n\u2022 Aluminum is only sparingly soluble in water between pH 6 and 8; thus aluminum concentration in most natural waters is extremely low."
	 "\n"
	 "\n\u2022 Aluminum is not bioaccumulated to a significant extent." 
	 "\n"
	 "Environmental Levels"
	 "\n Air"
	 "\n"
	 "\n\u2022 Average range: 0.005 to 0.18 μg/m3."
	 "\n"
	 "\n\u2022 0.4 to 8.0 μg/m3 in urban and industrial areas."
	 "\n"
	 "\n Sediment and Soil"
	 "\n"
	 "\n\u2022 Concentration in soil varies widely ranging from 7 to over 100 g/kg."
	 "\n"
	 "\n Water"
	 "\n"
	 "\n\u2022 Generally below 0.1 mg/L in surface water." withTitle:@"In the Environment"];		 
	
	
	// Aluminum Biomarkers
	[toxDoc addSection:@"\u2022 Aluminum can be measured in the blood, bone, urine, and feces. There are insufficient data to relate aluminum exposure levels with blood or urine levels."
	 "\n"
	 "\n\u2022 No biochemical or histological changes specific for aluminum exposure were identified." withTitle:@"Biomarkers"];
	
	
	// Aluminum Toxicokinetics
	[toxDoc addSection:@"\u2022 Aluminum is poorly absorbed following either oral or inhalation exposure and is essentially not absorbed dermally. Approximately 1.5-2 of inhaled and 0.01- 5% of ingested aluminum is absorbed. The absorption efficiency is dependent on chemical form, particle size (inhalation), and concurrent dietary exposure to chelators such as citric acid or lactic acid (oral)."
	 "\n"
	 "\n\u2022 Aluminum binds to various ligands in the blood and distributes to every organ, with highest concentrations ultimately found in bone and lung tissues."
	 "\n"
	 "\n\u2022 Absorbed aluminum is excreted principally in the urine and, to a lesser extent, in the bile." withTitle:@"Toxicokinetics"];
	 
	 
	 /*
	 "\n\nNormal Human Levels"
	 "\n\u2022 The total body burden of aluminum in healthy individuals is 30 to 50 mg."
	 "\n\u2022 Approximately 50% of the body burden is in the skeleton and 25% is in the lungs."
	 "\n\u2022 Aluminum levels in lungs increase with age."
	 "\n\u2022 Aluminum levels in bone tissue of healthy individuals range from 5 to 10 mg/kg."
	 "\n\u2022 Serum levels in healthy individuals rand from 1-3 μg/L." withTitle:@"Toxicokinetics"];
	*/
	
		[substanceList addObject:toxDoc];
    [toxDoc release];
    
    
	toxDoc = [[ToxDoc alloc] init];
	toxDoc.title = @"Benzene (empty)";
	[toxDoc addSection:@"This is Benzene Biomarkers section" withTitle:@"Biomarkers"];
	[toxDoc addSection:@"This is Benzene Toxicokinetics section" withTitle:@"Toxicokinetics"];
	[toxDoc addSection:@"This is Benzene Exposure Sources section" withTitle:@"Exposure Sources"];
	[toxDoc addSection:@"This is Benzene Health Effects section" withTitle:@"Health Effects"];
	[toxDoc addSection:@"This is Benzene Chemical Info section" withTitle:@"Chemical Info"];
	[toxDoc addSection:@"This is Benzene Normal Human Levels section" withTitle:@"Normal Human Levels"];
	[toxDoc addSection:@"This is Benzene Environmental Levels section" withTitle:@"Environmental Levels"];
	[substanceList addObject:toxDoc];
    [toxDoc release];
    
    self.list = substanceList;
    [substanceList release];
}

@end

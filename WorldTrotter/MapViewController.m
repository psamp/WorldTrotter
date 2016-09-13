//
//  MapViewController.m
//  WorldTrotter
//
//  Created by Princess Sampson on 9/13/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MapViewController.h"

@interface MapViewController ()
@property(nonatomic) MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mapView = [MKMapView new];
    self.view = self.mapView;
    
    NSArray *segItems = @[NSLocalizedString(@"Standard", @"Standard map view"), NSLocalizedString(@"Hybrid", @"Hybrid map view"), NSLocalizedString(@"Satellite", @"Satellie map view")];
    
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:segItems];
    segControl.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    segControl.selectedSegmentIndex = 0;
    segControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:segControl];
    
    [segControl addTarget:self
                   action:@selector(mapTypeChanged:)
         forControlEvents:UIControlEventValueChanged];
    
    UILayoutGuide *margins = self.view.layoutMarginsGuide;
    NSLayoutConstraint *topConstraint = [segControl.topAnchor constraintEqualToAnchor:self.topLayoutGuide.bottomAnchor constant:8];
    NSLayoutConstraint *leadingConstrant = [segControl.leadingAnchor constraintEqualToAnchor:margins.leadingAnchor];
    NSLayoutConstraint *trailingConstraint= [segControl.trailingAnchor constraintEqualToAnchor:margins.trailingAnchor];
    
    topConstraint.active = YES;
    leadingConstrant.active = YES;
    trailingConstraint.active = YES;
}

- (void)mapTypeChanged:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.mapView.mapType = MKMapTypeStandard;
            break;
        }
        case 1: {
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        }
        case 2: {
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        }
    }
}

@end

//
//  ViewController2.m
//  HelpWanted
//
//  Created by David on 16/8/16.
//  Copyright © 2016 Miquel. All rights reserved.
//

#import "ViewController2.h"
#import <MapKit/MapKit.h>


@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    [locationManager startUpdatingLocation];
    [mapa setShowsUserLocation:YES];
    NSLog(@"LocationManager inicializado");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Error detecting location %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation* location = (CLLocation*)locations.lastObject;
    CLLocationCoordinate2D loc = [location coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [mapa setRegion:region animated:YES];
    NSLog(@"Longitude: %f, Latitude: %f", location.coordinate.longitude, location.coordinate.latitude);
}

- (void)mapView:(MKMapView *)mapView
    didUpdateUserLocation:(nonnull MKUserLocation *)userLocation
{
    NSLog(@"Aquí debemos hacer zoom");
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [mapa setRegion:region animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

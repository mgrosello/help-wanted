//
//  ViewController2.h
//  HelpWanted
//
//  Created by David on 16/8/16.
//  Copyright © 2016 Miquel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/Corelocation.h>
#import <MapKit/MapKit.h>

@interface ViewController2 : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate> {

    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *mapa;
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;


@end

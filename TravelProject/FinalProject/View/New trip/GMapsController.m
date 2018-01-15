//
//  GMapsController.m
//  FinalProject
//
//  Created by Masha on 13.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "GMapsController.h"

@interface GMapsController ()

@end

@implementation GMapsController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)loadView {
    self.workWithNewTrip = [NewTripActions new];
    
    //загружаем из CoreData последний маршрут
    Routes *route = [self.workWithNewTrip NewRouteInfo];
    NSLog(@"search %@ with coordinates: %f, %f", route.startPoint.name, route.startPoint.latitude,
          route.startPoint.longitude);
    
    //установка изначального положения камеры
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:route.startPoint.latitude
                                                            longitude:route.startPoint.longitude
                                                                 zoom:3];
    
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    //использование геопозиции
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    mapView.settings.myLocationButton = YES;
    NSLog(@"User's location: %@", mapView.myLocation);
    
    //настройка карты: внешний вид и параметры управления
    UIEdgeInsets mapInsets = UIEdgeInsetsMake(100.0, 0.0, 100.0, 0.0);
    mapView.padding = mapInsets;
    mapView.accessibilityElementsHidden = NO;
    mapView.settings.compassButton = YES;
    mapView.settings.allowScrollGesturesDuringRotateOrZoom = NO;
    
    //добавление маркеров и пути
    [self addMarkerToMapView:mapView withLatitude:route.startPoint.latitude
                andLongitude:route.startPoint.longitude setTitle:route.startPoint.name];
    
    [self addMarkerToMapView:mapView withLatitude:route.finishPoint.latitude
                andLongitude:route.finishPoint.longitude setTitle:route.finishPoint.name];
    
    CoordinatesForGMaps *startPointCoords = [CoordinatesForGMaps new];
    startPointCoords.latitude = route.startPoint.latitude;
    startPointCoords.longitude = route.startPoint.longitude;
    
    CoordinatesForGMaps *finishPointCoords = [CoordinatesForGMaps new];
    finishPointCoords.latitude = route.finishPoint.latitude;
    finishPointCoords.longitude = route.finishPoint.longitude;
    
    NSArray *pathCoords = @[startPointCoords, finishPointCoords];
    [self addPath:pathCoords toMapView:mapView];
}

-(void)addMarkerToMapView:(GMSMapView *)mapView withLatitude:(double)latitude
             andLongitude:(double)longitude setTitle:(NSString *)title
{
    NSLog(@"Add marker");
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = title;
    //marker.snippet = snippet;
    marker.map = mapView;
}

//построение ломанной
-(void)addPath:(NSArray *)pointsArray toMapView:(GMSMapView *)mapView
{
    NSLog(@"Add path");
    GMSMutablePath *path = [GMSMutablePath path];
    CoordinatesForGMaps *coords = [CoordinatesForGMaps new];
    
    for (int i = 0; i < [pointsArray count]; i++)
    {
        coords = pointsArray[i];
        NSLog(@"%@",coords);
        [path addCoordinate:CLLocationCoordinate2DMake(coords.latitude, coords.longitude)];
    }
    
    GMSPolyline *polyline = [GMSPolyline polylineWithPath:path];
    polyline.map = mapView;
}
@end

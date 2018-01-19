//
//  KMD_GoogleMapsViewController.m
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_GoogleMapsViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "CoordinatesForGMaps.h"
#import "Routes+CoreDataClass.h"
#import "Points+CoreDataClass.h"
#import "KMD_WorkWithCoreData.h"

@interface KMD_GoogleMapsViewController ()

@property (nonatomic, strong) KMD_WorkWithCoreData *workWithCoreData;

@end

@implementation KMD_GoogleMapsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)loadView
{
    self.workWithCoreData = [KMD_WorkWithCoreData new];
    
    //загружаем из CoreData последний маршрут
    Routes *route = [self.workWithCoreData newRouteInfo];
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

//установка маркера
-(void)addMarkerToMapView:(GMSMapView *)mapView withLatitude:(double)latitude
             andLongitude:(double)longitude setTitle:(NSString *)title
{
    NSLog(@"Add marker");
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latitude, longitude);
    marker.title = title;
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

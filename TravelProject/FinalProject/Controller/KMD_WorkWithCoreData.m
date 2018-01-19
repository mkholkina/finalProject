//
//  KMD_WorkWithCoreData.m
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_WorkWithCoreData.h"
#import "AppDelegate.h"
#import "CoordinatesForGMaps.h"

static NSString *const urlFormatString = @"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyChKzhkDLESPzhlAzZR1TMFdawzvg2JzuM";

@implementation KMD_WorkWithCoreData

//создание новых элементов и сохранение в CoreData
-(void)savingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint
{
    Routes *route = [NSEntityDescription insertNewObjectForEntityForName:@"Routes"
                                                  inManagedObjectContext:self.coreDataContext];
    Points *pointStart = [NSEntityDescription insertNewObjectForEntityForName:@"Points"
                                                  inManagedObjectContext:self.coreDataContext];
    Points *pointFinish = [NSEntityDescription insertNewObjectForEntityForName:@"Points"
                                                       inManagedObjectContext:self.coreDataContext];
    route.startPoint = pointStart;
    route.finishPoint = pointFinish;
    pointStart.name = startPoint;
    pointFinish.name = finishPoint;
    
    NSError *errors = nil;
    if (![route.managedObjectContext save:&errors])
    {
        NSLog(@"Не удалось сохранить объект");
        NSLog(@"%@, %@", errors, errors.localizedDescription);
    }
    
    [self getCoordinatesForPlace:startPoint withIdentifier:0];
    [self getCoordinatesForPlace:finishPoint withIdentifier:1];
}

//работа с URL запросом, который получает координаты для введенного пунтка поездки
-(void)getCoordinatesForPlace:(NSString *)inputPoint withIdentifier:(NSInteger)identifier
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *generatedURL = [self generateURL:inputPoint];
    CoordinatesForGMaps *coordinates = [CoordinatesForGMaps new];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:generatedURL]
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (!error)
                                                {
                                                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                         options:0
                                                                                                           error:nil];
                                                    NSString *str = json[@"results"][0][@"geometry"][@"location"]
                                                                                                            [@"lat"];
                                                    coordinates.latitude = [str doubleValue];
                                                    str = json[@"results"][0][@"geometry"][@"location"][@"lng"];
                                                    coordinates.longitude = [str doubleValue];
                                                    [self updateCoreDataItemWithCoordinates:coordinates
                                                                              useIdentifier:identifier];
                                                }
                                                else
                                                {
                                                    NSLog(@"Error occured!");
                                                }
                                            }];
    [dataTask resume];
}

//добавляет полученные координаты к сущности Points
-(void)updateCoreDataItemWithCoordinates:(CoordinatesForGMaps *)coordinates useIdentifier:(NSInteger)identifier
{
    NSError *error = nil;
    NSArray *resultArray = [self.coreDataContext executeFetchRequest:[Routes fetchRequest] error:&error];

    if (error)
    {
        NSLog(@"не удалось выполнить fetch request");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }

    NSInteger lastIndex = [resultArray count];
    Routes *object = resultArray[lastIndex - 1];
    if (identifier == 0)
    {
        object.startPoint.latitude = coordinates.latitude;
        object.startPoint.longitude = coordinates.longitude;
    }
    else
    {
        object.finishPoint.latitude = coordinates.latitude;
        object.finishPoint.longitude = coordinates.longitude;
    }
    
    NSError *errors = nil;
    if (![object.managedObjectContext save:&errors])
    {
        NSLog(@"Не удалось сохранить объект");
        NSLog(@"%@, %@", errors, errors.localizedDescription);
    }
}

//возвращает последний загруженный в CoreData маршрут
-(Routes *)newRouteInfo
{
    NSError *error = nil;
    NSArray *resultArray = [self.coreDataContext executeFetchRequest:[Routes fetchRequest] error:&error];
    
    if (error)
    {
        NSLog(@"не удалось выполнить fetch request");
        NSLog(@"%@, %@", error, error.localizedDescription);
        abort();
    }
    
    NSInteger lastIndex = [resultArray count];
    Routes *object = resultArray[lastIndex - 1];
    return object;
}

//возвращает последний загруженный в CoreData маршрут
-(NSArray *)listOfRoutes
{
    NSError *error = nil;
    NSArray *resultArray = [self.coreDataContext executeFetchRequest:[Routes fetchRequest] error:&error];
    if (error)
    {
        NSLog(@"не удалось выполнить fetch request");
        NSLog(@"%@, %@", error, error.localizedDescription);
        abort();
    }
    return resultArray;
}


//из строки с названием пунтка поездки делает строку в нужном формате для запроса к геокодеру google
-(NSString *)generateURL:(NSString *)inputPoint
{
    NSArray *arr = [inputPoint componentsSeparatedByString:@" "];
    NSString *address = @"";
    for (NSString *tmp in arr)
    {
        address = [address stringByAppendingFormat:@"+%@",tmp];
    }
    NSString *generatedURL = [NSString stringWithFormat:urlFormatString, address];
    return generatedURL;
}

- (NSManagedObjectContext *)coreDataContext
{
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    return context;
}

@end

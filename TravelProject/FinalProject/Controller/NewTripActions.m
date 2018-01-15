//
//  NewTripActions.m
//  FinalProject
//
//  Created by Masha on 13.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "NewTripActions.h"

@implementation NewTripActions


//сохраняет новый маршрут в CoreData
-(void)saveInCoreDataPoint:(NSString *)inputPoint fromRoute:(Routes *)route withIdentifier:(NSInteger)identifier
{
    NSLog(@"Saving route.. (%@)",inputPoint);
    
    Points *newPoint = [NSEntityDescription insertNewObjectForEntityForName:@"Points"
                                                  inManagedObjectContext:self.coreDataContext];
    newPoint.name = inputPoint;
    
    if (identifier == 0)
    {
        newPoint.startForRoute = route;
    }
    else
    {
        newPoint.finishForRoute = route;
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *generatedURL = [self generateURL:inputPoint];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:generatedURL]
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (!error)
                                                {
                                                    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                         options:0
                                                                                                           error:nil];
                                                    NSString *str = json[@"results"][0][@"geometry"][@"location"][@"lat"];
                                                    newPoint.latitude = [str doubleValue];
                                                    str = json[@"results"][0][@"geometry"][@"location"][@"lng"];
                                                    newPoint.longitude = [str doubleValue];
                                                    NSLog(@"Result: %@ %f , %f", inputPoint, newPoint.latitude,
                                                          newPoint.longitude);
                                                    NSError *errors = nil;
                                                    if (![newPoint.managedObjectContext save:&errors])
                                                    {
                                                        NSLog(@"Не удалось сохранить объект (%@)",inputPoint);
                                                        NSLog(@"%@, %@", errors, errors.localizedDescription);
                                                    }
                                                    NSLog(@"Сохранено: %@ (%f, %f)",newPoint.name, newPoint.latitude,
                                                          newPoint.longitude);
                                                }
                                                else
                                                {
                                                    NSLog(@"Error occured! (%@ : %@)",inputPoint, error);
                                                }
                                            }];
    
    [dataTask resume];
}

-(void)startSavingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint
{
    Routes *route = [NSEntityDescription insertNewObjectForEntityForName:@"Routes"
                                                  inManagedObjectContext:self.coreDataContext];
    NSError *errors = nil;
    if (![route.managedObjectContext save:&errors])
    {
        NSLog(@"Не удалось сохранить объект");
        NSLog(@"%@, %@", errors, errors.localizedDescription);
    }
    
    [self saveInCoreDataPoint:startPoint fromRoute:route withIdentifier:0];
    [self saveInCoreDataPoint:finishPoint fromRoute:route withIdentifier:1];
}

- (NSManagedObjectContext *)coreDataContext
{
    UIApplication *application = [UIApplication sharedApplication];
    NSPersistentContainer *container = ((AppDelegate *)(application.delegate)).persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    return context;
}

//возвращает последний загруженный в CoreData маршрут
-(Routes *)NewRouteInfo
{
    NSError *error = nil;
    NSArray *resultArray = [self.coreDataContext executeFetchRequest:[Routes fetchRequest] error:&error];
    
    if (error)
    {
        NSLog(@"не удалось выполнить fetch request");
        NSLog(@"%@, %@", error, error.localizedDescription);
        abort();
    }
    
    for (Routes *object in resultArray)
    {
        NSLog(@"%@ -> %@", object.startPoint.name, object.finishPoint.name);
    }
    
    NSInteger lastIndex = [resultArray count];
    Routes *object = resultArray[lastIndex - 1];
    return object;
}

-(NSString *)generateURL:(NSString *)inputPoint
{
    NSArray *arr = [inputPoint componentsSeparatedByString:@" "];
    NSString *address = @"";
    for (NSString *tmp in arr)
    {
        address = [address stringByAppendingFormat:@"+%@",tmp];
    }
    NSString *generatedURL = [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/geocode/json?address=%@&key=AIzaSyChKzhkDLESPzhlAzZR1TMFdawzvg2JzuM", address];
    return generatedURL;
}

@end


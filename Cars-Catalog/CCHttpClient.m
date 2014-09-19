//
//  CCHttpClient.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCHttpClient.h"
#import "CCSettings.h"

@implementation CCHttpClient

- (AFHTTPRequestOperation *)get:(NSString *)url success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return [[self manager] GET:url parameters:nil success:success failure:failure];
}

- (AFHTTPRequestOperation *)post:(NSDictionary *)data to:(NSString *)url success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return [[self manager] POST:url parameters:data success:success failure:failure];
}

#pragma mark - Private

- (AFHTTPRequestOperationManager *)manager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requestSerializer setValue:[CCSettings apiApplicationId] forHTTPHeaderField:@"X-Parse-Application-Id"];
    [requestSerializer setValue:[CCSettings apiKey] forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    manager.requestSerializer = requestSerializer;

    return manager;
}

@end

//
//  CCHttpClient.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCHttpClient.h"

@implementation CCHttpClient

- (AFHTTPRequestOperation *)get:(NSString *)url success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *, NSError *))failure
{
    return [[self manager] GET:url parameters:nil success:success failure:failure];
}

- (AFHTTPRequestOperationManager *)manager
{
    return [AFHTTPRequestOperationManager manager];
}

@end

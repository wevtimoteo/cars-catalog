//
//  CCHttpClient.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface CCHttpClient : NSObject

- (AFHTTPRequestOperation *)get:(NSString *)url
                          success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                           failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end


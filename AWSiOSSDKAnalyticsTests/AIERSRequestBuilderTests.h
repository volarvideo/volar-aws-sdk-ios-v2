/*
 * Copyright 2010-2014 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "AmazonInsightsSDKTests.h"
#import "AWSMobileAnalyticsERSRequestBuilder.h"
#import "AITestConfiguration.h"
#import "AWSMobileAnalyticsSerializerFactory.h"
#import "AIInsightsContextBuilder.h"
#import "AWSMobileAnalyticsConfigurationKeys.h"
#import "GZIP.h"
#import "AWSMobileAnalyticsStringUtils.h"
#import "AWSMobileAnalyticsRequest.h"
#import "AWSMobileAnalyticsDefaultHttpClient.h"

@interface AIERSRequestBuilderTests : XCTestCase
{
    AWSMobileAnalyticsERSRequestBuilder *_target;
    AITestConfiguration *_configuration;
}

@end

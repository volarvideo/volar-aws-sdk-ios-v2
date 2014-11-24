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

#import <XCTest/XCTest.h>
#import "CloudWatch.h"
#import "AWSTestUtility.h"

@interface AWSCloudWatchTests : XCTestCase

@end

@implementation AWSCloudWatchTests

+ (void)setUp {
    [super setUp];
    [AWSTestUtility setupCognitoCredentialsProvider];
}

- (void)setUp {
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown {
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testListMetrics {
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];

    [[[cloudWatch listMetrics:nil] continueWithBlock:^id(BFTask *task) {
        if (task.error) {
            XCTFail(@"Error: [%@]", task.error);
        }

        if (task.result) {
            XCTAssertTrue([task.result isKindOfClass:[AWSCloudWatchListMetricsOutput class]]);
            AWSCloudWatchListMetricsOutput *listMetricsOutput = task.result;
            XCTAssertNotNil(listMetricsOutput.metrics);
        }

        return nil;
    }] waitUntilFinished];
}

- (void)testGetMetricStatisticsFailed {
    AWSCloudWatch *cloudWatch = [AWSCloudWatch defaultCloudWatch];
    
    AWSCloudWatchGetMetricStatisticsInput *statisticsInput = [AWSCloudWatchGetMetricStatisticsInput new];
    statisticsInput.namespace = @""; //namespace is empty
    
    [[[cloudWatch getMetricStatistics:statisticsInput] continueWithBlock:^id(BFTask *task) {
        XCTAssertNotNil(task.error, @"Expected MissingParameter error not found.");
        return nil;
    }] waitUntilFinished];
    
}

@end

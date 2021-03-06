/*
Copyright 2021 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import <Foundation/Foundation.h>
#import <AEPCore/AEPCore-Swift.h>
#import <AEPServices/AEPServices-Swift.h>
#import <AEPAudience/AEPAudience-Swift.h>
#import "ACPAudience.h"
#import "ACPExtension.h"
#import "ACPCore.h"
#import "NSError+AEPError.h"

@implementation ACPAudience

#pragma mark - Audience Manager

+ (nonnull NSString*) extensionVersion {
    return [AEPMobileAudience extensionVersion];
}

+ (void) registerExtension {
    [ACPCore registerExtension:[AEPMobileAudience class] error:nil];
}

+ (void) getVisitorProfile: (nullable void (^) (NSDictionary* __nullable profile, NSError* _Nullable error)) completionHandler {
    [AEPMobileAudience getVisitorProfile:^(NSDictionary<NSString *,NSString *> * _Nullable profile, enum AEPError error) {
        completionHandler(profile, [NSError errorFromAEPError:error]);
    }];
}

+ (void) signalWithData: (NSDictionary* __nullable) data withCompletionHandler: (nullable void (^) (NSDictionary* __nullable profile, NSError* _Nullable error)) completionHandler {
    [AEPMobileAudience signalWithData:data completion:^(NSDictionary<NSString *,NSString *> * _Nullable profile, enum AEPError error) {
        completionHandler(profile, [NSError errorFromAEPError:error]);
    }];
}

+ (void) reset {
    [AEPMobileAudience reset];
}

@end

/*
Copyright 2018 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

#import <Foundation/Foundation.h>
#import "ACPExtension.h"
#import "ACPCore.h"

@implementation ACPExtension {
    ACPExtensionApi* api_;
}

- (nullable instancetype)initWithApi:(nonnull ACPExtensionApi*) api {
    if (self = [super init]) {
       api_ = api;
       [api_ setExtension:self];
    }
    return [self init];
}

- (nonnull instancetype) init {
    return self;
}

- (nullable NSString*) name {
    return nil;
}

- (nullable NSString*) version {
    return nil;
}

- (void) unexpectedError: (nonnull NSError*) error {
    if ([error isKindOfClass:[NSError class]]) {
        [ACPCore log:ACPMobileLogLevelError tag:@"ACPExtension" message:[error localizedDescription]];
    }
}

- (nonnull ACPExtensionApi*) api {
    return api_;
}

- (void) onUnregister {
    api_ = nil;
}

@end

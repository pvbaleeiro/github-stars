//
//  TesteRouterTests.m
//  github-stars
//
//  Created by Victor Baleeiro on 05/01/2018.
//  Copyright © 2018 brotherlabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TesteRouter.h"

@interface TesteRouterTests : XCTestCase

@property (nonatomic, strong) TesteRouter *router;

@end

@implementation TesteRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[TesteRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end

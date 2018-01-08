//
//  TesteViewControllerTests.m
//  github-stars
//
//  Created by Victor Baleeiro on 05/01/2018.
//  Copyright © 2018 brotherlabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TesteViewController.h"

#import "TesteViewOutput.h"

@interface TesteViewControllerTests : XCTestCase

@property (nonatomic, strong) TesteViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation TesteViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[TesteViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(TesteViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов TesteViewInput

@end

//
//  TestePresenterTests.m
//  github-stars
//
//  Created by Victor Baleeiro on 05/01/2018.
//  Copyright © 2018 brotherlabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TestePresenter.h"

#import "TesteViewInput.h"
#import "TesteInteractorInput.h"
#import "TesteRouterInput.h"

@interface TestePresenterTests : XCTestCase

@property (nonatomic, strong) TestePresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation TestePresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[TestePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(TesteInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(TesteRouterInput));
    self.mockView = OCMProtocolMock(@protocol(TesteViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов TesteModuleInput

#pragma mark - Тестирование методов TesteViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов TesteInteractorOutput

@end

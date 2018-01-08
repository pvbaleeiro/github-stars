//
//  TesteInteractorTests.m
//  github-stars
//
//  Created by Victor Baleeiro on 05/01/2018.
//  Copyright © 2018 brotherlabs. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "TesteInteractor.h"

#import "TesteInteractorOutput.h"

@interface TesteInteractorTests : XCTestCase

@property (nonatomic, strong) TesteInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation TesteInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[TesteInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(TesteInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов TesteInteractorInput

@end

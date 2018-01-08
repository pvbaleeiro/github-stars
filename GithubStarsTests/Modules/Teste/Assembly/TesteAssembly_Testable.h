//
//  TesteAssembly_Testable.h
//  github-stars
//
//  Created by Victor Baleeiro on 05/01/2018.
//  Copyright © 2018 brotherlabs. All rights reserved.
//

#import "TesteAssembly.h"

@class TesteViewController;
@class TesteInteractor;
@class TestePresenter;
@class TesteRouter;

/**
 @author Victor Baleeiro

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface TesteAssembly ()

- (TesteViewController *)viewTeste;
- (TestePresenter *)presenterTeste;
- (TesteInteractor *)interactorTeste;
- (TesteRouter *)routerTeste;

@end

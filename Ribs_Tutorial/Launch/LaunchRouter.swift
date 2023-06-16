//
//  LaunchRouter.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs

protocol LaunchInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: LaunchRouting? { get set }
    var listener: LaunchListener? { get set }
}

// ~viewcontrollable = 라우터가 뷰 계층을 조작하기 위해 호출하는 메소드를 선언
protocol LaunchViewControllable: ViewControllable {

}

final class LaunchRouter: ViewableRouter<LaunchInteractable, LaunchViewControllable>, LaunchRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LaunchInteractable,
                  viewController: LaunchViewControllable,
                  loggedOutBuilder: LoggedOutBuildable,
                  loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }
    
    func routeToLoggedIn(_ token: String) {
        if let loggedOut = loggedOut {
            detachChild(loggedOut)
            viewController.dismiss(viewController: loggedOut.viewControllable)
            self.loggedOut = nil
        }
        let loggedIn = loggedInBuilder.build(withListener: interactor)
        self.loggedIn = loggedIn
        self.attachChild(loggedIn)
        viewController.present(viewController: loggedIn.viewControllable)
    }
    
    func routeToLoggedOut() {
        if let loggedIn = loggedIn {
            detachChild(loggedIn)
            viewController.dismiss(viewController: loggedIn.viewControllable)
            self.loggedIn = nil
        }
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        self.attachChild(loggedOut)
        viewController.present(viewController: loggedOut.viewControllable)
    }
    
    // MARK: private
    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable
    
    private var loggedOut: ViewableRouting?
    private var loggedIn: ViewableRouting?
}

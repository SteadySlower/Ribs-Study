//
//  LaunchInteractor.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs
import RxSwift

protocol LaunchRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func routeToLoggedIn(_ token: String)
    func routeToLoggedOut()
}

protocol LaunchPresentable: Presentable {
    var listener: LaunchPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LaunchListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class LaunchInteractor: PresentableInteractor<LaunchPresentable>, LaunchInteractable, LaunchPresentableListener {

    weak var router: LaunchRouting?
    weak var listener: LaunchListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LaunchPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didLogin(_ token: String) {
        router?.routeToLoggedIn(token)
    }
    
    func didLogout() {
        router?.routeToLoggedOut()
    }
}

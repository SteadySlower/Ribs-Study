//
//  RootTabInteractor.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift

protocol RootTabRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol RootTabPresentable: Presentable {
    var listener: RootTabPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootTabListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootTabInteractor: PresentableInteractor<RootTabPresentable>, RootTabInteractable, RootTabPresentableListener {

    weak var router: RootTabRouting?
    weak var listener: RootTabListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootTabPresentable) {
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
}

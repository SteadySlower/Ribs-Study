//
//  WordListInteractor.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift

protocol WordListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol WordListPresentable: Presentable {
    var listener: WordListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol WordListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func wordListDismiss()
}

final class WordListInteractor: PresentableInteractor<WordListPresentable>, WordListInteractable, WordListPresentableListener {

    weak var router: WordListRouting?
    weak var listener: WordListListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: WordListPresentable) {
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
    
    func willDisappear() {
        listener?.wordListDismiss()
    }
}

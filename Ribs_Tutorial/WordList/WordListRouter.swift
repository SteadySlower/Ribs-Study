//
//  WordListRouter.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol WordListInteractable: Interactable {
    var router: WordListRouting? { get set }
    var listener: WordListListener? { get set }
}

protocol WordListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class WordListRouter: ViewableRouter<WordListInteractable, WordListViewControllable>, WordListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: WordListInteractable, viewController: WordListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

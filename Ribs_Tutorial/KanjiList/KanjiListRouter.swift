//
//  KanjiListRouter.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol KanjiListInteractable: Interactable {
    var router: KanjiListRouting? { get set }
    var listener: KanjiListListener? { get set }
}

protocol KanjiListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class KanjiListRouter: ViewableRouter<KanjiListInteractable, KanjiListViewControllable>, KanjiListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: KanjiListInteractable, viewController: KanjiListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

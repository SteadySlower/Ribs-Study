//
//  BookListRouter.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol BookListInteractable: Interactable {
    var router: BookListRouting? { get set }
    var listener: BookListListener? { get set }
}

protocol BookListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class BookListRouter: ViewableRouter<BookListInteractable, BookListViewControllable>, BookListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: BookListInteractable, viewController: BookListViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

//
//  LoggedInRouter.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs
import UIKit

protocol LoggedInInteractable: Interactable, BookListListener, KanjiListListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func setViewControllers(_ viewControllers: [any ViewControllable])
}

final class LoggedInRouter: ViewableRouter<LoggedInInteractable, LoggedInViewControllable>, LoggedInRouting {
    
    private let bookList: BookListBuildable
    private let kanjiList: KanjiListBuildable

    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         bookList: BookListBuildable,
         kanjiList: KanjiListBuildable) {
        self.bookList = bookList
        self.kanjiList = kanjiList
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func setTabs() {
        let bookListRouting = bookList.build(withListener: interactor)
        let kanjiListRouting = kanjiList.build(withListener: interactor)
        
        attachChild(bookListRouting)
        attachChild(kanjiListRouting)
        
        let viewControllers = [
            NavigationViewControllable(root: bookListRouting.viewControllable),
            kanjiListRouting.viewControllable
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}

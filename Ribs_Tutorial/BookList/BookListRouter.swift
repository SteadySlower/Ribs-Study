//
//  BookListRouter.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol BookListInteractable: Interactable, WordListListener {
    var router: BookListRouting? { get set }
    var listener: BookListListener? { get set }
}

protocol BookListViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class BookListRouter: ViewableRouter<BookListInteractable, BookListViewControllable>, BookListRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: BookListInteractable,
                  viewController: BookListViewControllable,
                  wordListBuilder: WordListBuilder) {
        self.wordListBuilder = wordListBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachWordList() {
        guard wordList == nil else { return }
        let router = wordListBuilder.build(withListener: interactor)
        let wordList = router.viewControllable
        viewControllable.pushViewController(wordList, animated: true)
        self.wordList = router
        attachChild(router)
    }
    
    func detachWordList() {
        guard let wordList = wordList else { return }
        detachChild(wordList)
        self.wordList = nil
    }
    
    // MARK: Children
    
    private let wordListBuilder: WordListBuilder
    
    private var wordList: ViewableRouting?
}

//
//  BookListBuilder.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol BookListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class BookListComponent: Component<BookListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

extension BookListComponent: WordListDependency {
    
}

// MARK: - Builder

protocol BookListBuildable: Buildable {
    func build(withListener listener: BookListListener) -> BookListRouting
}

final class BookListBuilder: Builder<BookListDependency>, BookListBuildable {

    override init(dependency: BookListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: BookListListener) -> BookListRouting {
        let component = BookListComponent(dependency: dependency)
        let viewController = BookListViewController()
        let interactor = BookListInteractor(presenter: viewController)
        interactor.listener = listener
        
        let wordListBuilder = WordListBuilder(dependency: component)
        return BookListRouter(interactor: interactor,
                              viewController: viewController,
                              wordListBuilder: wordListBuilder)
    }
}

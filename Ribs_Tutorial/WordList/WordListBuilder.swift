//
//  WordListBuilder.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol WordListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class WordListComponent: Component<WordListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol WordListBuildable: Buildable {
    func build(withListener listener: WordListListener) -> WordListRouting
}

final class WordListBuilder: Builder<WordListDependency>, WordListBuildable {

    override init(dependency: WordListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: WordListListener) -> WordListRouting {
        let component = WordListComponent(dependency: dependency)
        let viewController = WordListViewController()
        let interactor = WordListInteractor(presenter: viewController)
        interactor.listener = listener
        return WordListRouter(interactor: interactor, viewController: viewController)
    }
}

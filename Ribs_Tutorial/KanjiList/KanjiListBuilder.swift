//
//  KanjiListBuilder.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol KanjiListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class KanjiListComponent: Component<KanjiListDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol KanjiListBuildable: Buildable {
    func build(withListener listener: KanjiListListener) -> KanjiListRouting
}

final class KanjiListBuilder: Builder<KanjiListDependency>, KanjiListBuildable {

    override init(dependency: KanjiListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: KanjiListListener) -> KanjiListRouting {
        let component = KanjiListComponent(dependency: dependency)
        let viewController = KanjiListViewController()
        let interactor = KanjiListInteractor(presenter: viewController)
        interactor.listener = listener
        return KanjiListRouter(interactor: interactor, viewController: viewController)
    }
}

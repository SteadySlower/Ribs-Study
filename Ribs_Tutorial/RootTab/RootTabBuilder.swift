//
//  RootTabBuilder.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol RootTabDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootTabComponent: Component<RootTabDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootTabBuildable: Buildable {
    func build(withListener listener: RootTabListener) -> RootTabRouting
}

final class RootTabBuilder: Builder<RootTabDependency>, RootTabBuildable {

    override init(dependency: RootTabDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: RootTabListener) -> RootTabRouting {
        let component = RootTabComponent(dependency: dependency)
        let viewController = RootTabViewController()
        let interactor = RootTabInteractor(presenter: viewController)
        interactor.listener = listener
        return RootTabRouter(interactor: interactor, viewController: viewController)
    }
}

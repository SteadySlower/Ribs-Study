//
//  LaunchBuilder.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs

protocol LaunchDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LaunchComponent: Component<LaunchDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

extension LaunchComponent: LoggedOutDependency {
    
}

extension LaunchComponent: LoggedInDependency {
    
}

// MARK: - Builder

protocol LaunchBuildable: Buildable {
    func build() -> LaunchRouting
}

final class LaunchBuilder: Builder<LaunchDependency>, LaunchBuildable {

    override init(dependency: LaunchDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = LaunchComponent(dependency: dependency)
        let viewController = LaunchViewController()
        let interactor = LaunchInteractor(presenter: viewController)
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let loggedInBuilder = LoggedInBuilder(dependency: component)
        return LaunchRouter(interactor: interactor,
                            viewController: viewController,
                            loggedOutBuilder: loggedOutBuilder,
                            loggedInBuilder: loggedInBuilder)
    }
}

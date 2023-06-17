//
//  LoggedInBuilder.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs

protocol LoggedInDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoggedInComponent: Component<LoggedInDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

extension LoggedInComponent: BookListDependency {
    
}

extension LoggedInComponent: KanjiListDependency {
    
}


// MARK: - Builder

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener) -> LoggedInRouting
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {

    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener) -> LoggedInRouting {
        let component = LoggedInComponent(dependency: dependency)
        let viewController = LoggedInViewController()
        let interactor = LoggedInInteractor(presenter: viewController)
        interactor.listener = listener
        
        let bookListBuilder = BookListBuilder(dependency: component)
        let kanjiListBuilder = KanjiListBuilder(dependency: component)
        return LoggedInRouter(interactor: interactor,
                              viewController: viewController,
                              bookList: bookListBuilder,
                              kanjiList: kanjiListBuilder)
    }
}

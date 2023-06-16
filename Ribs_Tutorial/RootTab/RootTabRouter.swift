//
//  RootTabRouter.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

protocol RootTabInteractable: Interactable {
    var router: RootTabRouting? { get set }
    var listener: RootTabListener? { get set }
}

protocol RootTabViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootTabRouter: ViewableRouter<RootTabInteractable, RootTabViewControllable>, RootTabRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: RootTabInteractable, viewController: RootTabViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}

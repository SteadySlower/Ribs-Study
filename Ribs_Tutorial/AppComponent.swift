//
//  AppComponent.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs

class AppComponent: Component<EmptyDependency>, LaunchDependency {

    init() {
        super.init(dependency: EmptyComponent())
    }
}

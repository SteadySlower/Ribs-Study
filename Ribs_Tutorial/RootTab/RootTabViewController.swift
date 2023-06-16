//
//  RootTabViewController.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift
import UIKit

protocol RootTabPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootTabViewController: UIViewController, RootTabPresentable, RootTabViewControllable {

    weak var listener: RootTabPresentableListener?
}

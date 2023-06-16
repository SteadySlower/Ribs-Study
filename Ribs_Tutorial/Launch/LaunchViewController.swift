//
//  LaunchViewController.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs
import RxSwift
import UIKit

protocol LaunchPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LaunchViewController: UIViewController, LaunchPresentable, LaunchViewControllable {

    weak var listener: LaunchPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

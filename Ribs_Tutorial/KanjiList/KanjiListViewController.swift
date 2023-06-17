//
//  KanjiListViewController.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift
import UIKit

protocol KanjiListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class KanjiListViewController: UIViewController, KanjiListPresentable, KanjiListViewControllable {

    weak var listener: KanjiListPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "한자",
                                       image: UIImage(systemName: "character"),
                                       tag: 1)
    }
}

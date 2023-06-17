//
//  BookListViewController.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift
import UIKit

protocol BookListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class BookListViewController: UIViewController, BookListPresentable, BookListViewControllable {

    weak var listener: BookListPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "단어장",
                                       image: UIImage(systemName: "book"),
                                       tag: 0)
    }
    
    
}

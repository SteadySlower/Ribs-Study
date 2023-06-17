//
//  BookListViewController.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol BookListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func navigateToWordList()
}

final class BookListViewController: UIViewController, BookListPresentable, BookListViewControllable {

    weak var listener: BookListPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "단어장",
                                       image: UIImage(systemName: "book"),
                                       tag: 0)
        view.backgroundColor = .white
        configure()
        
    }
    
    private let navigateButton: UIButton = {
        let button = UIButton()
        button.setTitle("단어 리스트", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(navigationButtonTapped), for: .touchDown)
        return button
    }()
    
    @objc func navigationButtonTapped() {
        listener?.navigateToWordList()
    }
    
    private func configure() {
        view.addSubview(navigateButton)
        navigateButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.center.equalToSuperview()
        }
    }
}

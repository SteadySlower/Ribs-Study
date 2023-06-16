//
//  LoggedInViewController.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedInPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func logout()
}

final class LoggedInViewController: UIViewController, LoggedInPresentable, LoggedInViewControllable {

    weak var listener: LoggedInPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
    }
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchDown)
        return button
    }()
    
    private func configure() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.centerY.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func logoutButtonTapped() {
        listener?.logout()
    }
    
}

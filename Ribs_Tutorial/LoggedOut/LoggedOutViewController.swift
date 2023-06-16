//
//  LoggedOutViewController.swift
//  Ribs_Tutorial
//
//  Created by Jong Won Moon on 2023/06/16.
//

import RIBs
import RxSwift
import UIKit
import SnapKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    func login(_ id: String, _ password: String)
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
    }
    
    private let idField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID"
        tf.text = "Teddy"
        return tf
    }()
    
    private let passwordField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.text = "test1234"
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchDown)
        return button
    }()
    
    private func configure() {
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.centerY.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(passwordField)
        passwordField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(loginButton)
            make.bottom.equalTo(loginButton.snp.top).offset(-50)
        }
        
        view.addSubview(idField)
        idField.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalTo(loginButton)
            make.bottom.equalTo(passwordField.snp.top).offset(-50)
        }
        

    }
    
    @objc private func loginButtonTapped() {
        guard let id = idField.text,
              let password = passwordField.text else { return }
        listener?.login(id, password)
    }
}

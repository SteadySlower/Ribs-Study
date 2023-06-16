//
//  ViewControllable+.swift
//  Ribs_Tutorial
//
//  Created by JW Moon on 2023/06/17.
//

import RIBs

extension ViewControllable {
    func present(viewController: ViewControllable) {
        viewController.uiviewController.modalPresentationStyle = .fullScreen
        self.uiviewController.present(viewController.uiviewController, animated: false, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        if self.uiviewController.presentedViewController === viewController.uiviewController {
            self.uiviewController.dismiss(animated: false)
        }
    }
}

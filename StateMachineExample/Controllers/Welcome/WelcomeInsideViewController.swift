//
//  WelcomeInsideViewController.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 16/2/17.
//  Copyright © 2017 GemmaDelOlmo. All rights reserved.
//

import UIKit

class WelcomeInsideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStateMachineForCurrentController()
        self.navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func viewWillDisappear(_ animated: Bool) {
        if (isMovingFromParentViewController) { //BackButtonTapped
            notifyStateMachine(.tapback)
        }
        super.viewWillDisappear(animated)
    }
    
    @objc func logoutTapped() {
        notifyStateMachine(.tapback)
    }

}

extension WelcomeInsideViewController: StateHandlingViewControllerProtocol {
    func notifyStateMachine(_ action: Actions) {
        guard let next = nextState(action) else {return}
        switch next {
        case .root:
            navigationController?.popToRootViewController(animated: true)
        default:
            return
        }
    }
    
    func setupStateMachineForCurrentController() {
        applicationStateMachine[.welcome] = [
            .tapback : .root
        ]
    }
}

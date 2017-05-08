//
//  SignupViewController.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 15/2/17.
//  Copyright © 2017 Gemma Del Olmo. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Signup"
        setupStateMachineForCurrentController()
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
    
    @IBAction func signupTapped(_ sender: UIButton) {
        notifyStateMachine(.tapSignup)
    }
}

extension SignupViewController: StateHandlingViewControllerProtocol {
    func notifyStateMachine(_ action: Actions) {
        guard let next = nextState(action) else {return}
        switch next {
        case .root:
            return
        case .welcome:
            let viewController = next.viewControllerToGo()
            self.navigationController?.pushViewController(viewController, animated: true)
        default:
            return
        }
    }
    
    func setupStateMachineForCurrentController() {
        applicationStateMachine[.signup] = [
            .tapback : .root,
            .tapSignup: .welcome
        ]
    }
}

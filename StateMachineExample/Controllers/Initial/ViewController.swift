//
//  ViewController.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 15/2/17.
//  Copyright © 2017 Gemma Del Olmo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStateMachineForCurrentController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBActions
    @IBAction func loginTapped(_ sender: UIButton) {
        notifyStateMachine(.tapLogin)
    }

    @IBAction func signupTapped(_ sender: UIButton) {
        notifyStateMachine(.tapSignup)
    }
    
}

extension ViewController: StateHandlingViewControllerProtocol {
    func notifyStateMachine(_ action: Actions) {
        guard let nextState = nextState(action) else {return}
        
        let viewController = nextState.viewControllerToGo()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setupStateMachineForCurrentController() {
        applicationStateMachine[.root] = [
            .tapLogin : .login,
            .tapSignup : .signup
        ]
    }
}


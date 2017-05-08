//
//  ApplicationStateManager.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 16/2/17.
//  Copyright © 2017 Gemma Del Olmo. All rights reserved.
//

import Foundation
import UIKit

enum Actions {
    case tapLogin
    case tapSignup
    case tapback
}

enum States {
    case root
    case login
    case signup
    case welcome
    
    func viewControllerToGo() -> UIViewController {
        switch self {
        case .root:
            return ViewController()
        case .login:
            return LoginViewController()
        case .signup:
            return SignupViewController()
        case .welcome:
            return WelcomeInsideViewController()
        }
    }
}

class ApplicationStateManager {
    private static let sharedInstance = ApplicationStateManager()
    var applicationStateMachine = StateMachine<States, Actions>(initialState: .root)
    
    class func sharedManager() -> ApplicationStateManager {
        return sharedInstance
    }
}

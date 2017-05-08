//
//  StateHandlingViewControllerProtocol.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 16/2/17.
//  Copyright © 2017 Gemma Del Olmo. All rights reserved.
//

import Foundation

protocol StateHandlingViewControllerProtocol {
    func notifyStateMachine(_ action: Actions)
    func setupStateMachineForCurrentController()
}

extension StateHandlingViewControllerProtocol {
    var applicationStateMachine: StateMachine<States, Actions> {
        get {
            return ApplicationStateManager.sharedManager().applicationStateMachine
        }
    }
    
    func nextState(_ action: Actions) -> States? {
        let nextState = applicationStateMachine.transition(action)
        return nextState
    }
}

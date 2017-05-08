//
//  StateMachine.swift
//  StateMachineExample
//
//  Created by Gemma del Olmo on 15/2/17.
//  Copyright © 2017 Gemma Del Olmo. All rights reserved.
//

import Foundation

class StateMachine<State, Action> where State: Hashable, Action: Hashable {
    
    private(set) var currentState: State
    private var statesAndActions: [State : [Action : State]] = [:]
    
    init(initialState: State) {
        currentState = initialState
    }
    
    subscript(state: State) -> [Action : State]? {
        get {
            return statesAndActions[state]
        }
        set(transitionsArray) {
            statesAndActions[state] = transitionsArray
        }
    }
    
    subscript(action: Action) -> State? {
        if let transitions = statesAndActions[currentState],
            let nextState = transitions[action] {
                return nextState
        }
        return nil
    }
    
    func transition(_ action: Action) -> State? {
        if let nextState = self[action] {
            currentState = nextState
            return nextState
        }
        return nil
    }
}

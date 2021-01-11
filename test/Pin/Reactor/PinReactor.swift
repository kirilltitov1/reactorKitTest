//
//  PinViewModel.swift
//  test
//
//  Created by Kirill Titov on 22.12.2020.
//

import Foundation
import ReactorKit

class PinReactor: Reactor {

    private let correctPin = "1580"
    
    enum Action {
        case inputPinCode(String)
    }
    
    // represent state changes
    enum Mutation {
        case pinCode(String)
        case pinCodeValidate(String)
    }
    
    // represents the current view state
    struct State {
        var pinCode: String
        var pinCodeValidate: String
    }
    
    let initialState: PinReactor.State
    
    init() {
        initialState = PinReactor.State(pinCode: "", pinCodeValidate: "")
    }
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case var .inputPinCode(simbol):
            let msg: String = {
                // оч мало подумал над логикой, когда пароль был не правильынй, и потом вввели новые символы то он убирает сообщение  
                if (self.isPinCodeCorrect(pin: currentState.pinCode+simbol) ||
                    !self.isPinCodeFull(pin: currentState.pinCode+simbol)) ||
                    (self.isPinCodeCorrect(pin: currentState.pinCode)) {
                    return ""
                } else {
                    return "Incorrect pin"
                }
            }()
            if self.isPinCodeCorrect(pin: currentState.pinCode) {
                simbol = ""
            }
            return Observable.concat([Observable.just(Mutation.pinCode(simbol)),
                                      Observable.just(Mutation.pinCodeValidate(msg))])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .pinCode(simbol):
            newState.pinCode.append(simbol)
        case let .pinCodeValidate(msg):
            newState.pinCodeValidate = msg
        }
        return newState
    }
}

// MARK: - Validating
extension PinReactor {
    func isPinCodeFull(pin: String) -> Bool {
        return pin.count == 4 ? true : false
    }
    func isPinCodeCorrect(pin: String) -> Bool {
        return pin == self.correctPin
    }
}

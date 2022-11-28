//
//  BackgroundStopState.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import Foundation
import SpriteKit
import GameKit

class BackgroundStopState: GKState {
    
    private var node: BackgroundNode
    
    init(node: BackgroundNode) {
        self.node = node
    }
    
    override func nextState() {
        node.machineState.enter(BackgroundMovingState.self)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is BackgroundMovingState.Type:
            return true
        default:
            return false
        }
    }
    
    override func didEnter(from previousState: GKState?) {
        node.removeAllActions()
    }
}


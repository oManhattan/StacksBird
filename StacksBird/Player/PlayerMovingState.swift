//
//  PlayerMovingState.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 26/11/22.
//

import Foundation
import SpriteKit
import GameKit

class PlayerMovingState: GKState {
    
    var node: PlayerNode
    
    init(node: PlayerNode) {
        self.node = node
    }
    
    override func nextState() {
        self.node.machineState.enter(PlayerJumpState.self)
    }
}

//
//  PlayerJumpState.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 26/11/22.
//

import Foundation
import SpriteKit
import GameKit

class PlayerJumpState: GKState {
    
    var node: PlayerNode
    
    init(node: PlayerNode) {
        self.node = node
    }
    
    override func nextState() {
        self.node.machineState.enter(PlayerMovingState.self)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
            switch stateClass {
            case is PlayerMovingState.Type:
                return true
            default:
                return false
            }
        }
    
    override func didEnter(from previousState: GKState?) {
        node.removeAllActions()
        let action = SKAction.customAction(withDuration: 1/60) { node, _ in
//            guard let node = node as? PlayerNode else { return }
            guard let player = node.childNode(withName: "physicsBody") else { return }
            player.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 5))
        }
        node.run(action)
    }
    
    
}

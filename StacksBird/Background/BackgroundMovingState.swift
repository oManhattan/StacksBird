//
//  BackgroundMovingState.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import Foundation
import SpriteKit
import GameKit

class BackgroundMovingState: GKState {
    
    private var node: BackgroundNode
    
    init(node: BackgroundNode) {
        self.node = node
    }
    
    override func nextState() {
        node.machineState.enter(BackgroundStopState.self)
    }
    
    override func isValidNextState(_ stateClass: AnyClass) -> Bool {
        switch stateClass {
        case is BackgroundStopState.Type:
            return true
        default:
            return false
        }
    }
    
    override func didEnter(from previousState: GKState?) {
        node.removeAllActions()
        
        let action = SKAction.customAction(withDuration: 1 / 60) { node, _ in
            
            guard let node = node as? BackgroundNode else {
                print("failed to convert")
                return
            }
            
            for child in node.children as! [SKSpriteNode] {
                guard let _ = child.name else { continue }

                child.position.x -= node.backgroundSpeed
                
                if child.frame.maxX - node.backgroundSpeed <= -10 {
                    var newPosition = CGPoint()
                    newPosition.x = node.frame.maxX - node.backgroundSpeed - node.spacingCompensation
                    newPosition.y = ((child as? GroundNode) != nil) ? 0 : node.childNode(withName: "ground-0")!.frame.maxY - 30
                    child.position = newPosition
                }
            }
        }
        
        node.run(SKAction.repeatForever(action))
    }
}

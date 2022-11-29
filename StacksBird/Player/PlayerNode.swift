//
//  PlayerNode.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 26/11/22.
//

import Foundation
import SpriteKit
import GameKit

class PlayerNode: SKSpriteNode {
    
    var machineState: GKStateMachine
    
    
    init() {
        self.machineState = GKStateMachine(states: [])
        super.init(texture: nil, color: .clear, size: CGSize(width: 20, height: 20))
        self.name = "playerNode"
        self.machineState = GKStateMachine(states: [PlayerJumpState(node: self), PlayerMovingState(node: self)])
        
        guard let playerImage = UIImage(named: "birdhead") else { return }
        
        let physicsBody = SKSpriteNode(texture: SKTexture(image: playerImage), color: .clear, size: self.size)
        physicsBody.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        physicsBody.position.x = frame.maxX / 2
        physicsBody.position.y =  -physicsBody.frame.minY / 2
        physicsBody.physicsBody = SKPhysicsBody(rectangleOf: physicsBody.size)
        physicsBody.physicsBody?.affectedByGravity = true
        physicsBody.name = "physicsBody"
        physicsBody.physicsBody?.categoryBitMask = 1
        
        addChild(physicsBody)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported.")
    }
}

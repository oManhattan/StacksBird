//
//  BackgroundNode.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import Foundation
import SpriteKit
import GameKit

class BackgroundNode: SKSpriteNode {
    
    var machineState: GKStateMachine
    
    let groundSize: CGFloat = 130
    let spacingCompensation: CGFloat = 10
    var backgroundSpeed: CGFloat = 2
    
    init(size: CGSize) {
        
        self.machineState = GKStateMachine(states: [])
        
        super.init(texture: nil, color: .clear, size: size)
        self.anchorPoint = .zero
        self.position = .zero
        
        self.machineState = GKStateMachine(states: [BackgroundMovingState(node: self), BackgroundStopState(node: self)])
        
        for i in 0...1 {
            let ground: GroundNode = .init(texture: nil, color: .clear, size: CGSize(width: size.width + spacingCompensation, height: groundSize))
            ground.name = "ground-\(i)"
            ground.anchorPoint = .zero
            ground.position.x = (frame.maxX * CGFloat(i)) - 10
            ground.position.y = 0
            addChild(ground)
            
            let background: SKSpriteNode = .init(texture: SKTexture(image: UIImage(named: "Background0")!), color: .clear, size: CGSize(width: size.width + spacingCompensation, height: size.height - groundSize))
            background.name = "background-\(i)"
            background.anchorPoint = .zero
            background.position.x = (frame.maxX * CGFloat(i)) - 10
            background.position.y = ground.frame.maxY - 30
            background.zPosition = -3
            addChild(background)
        }
        
        let physicsGround = SKSpriteNode(texture: nil, color: .clear, size: CGSize(width: size.width - 2, height: groundSize * 0.7))
        physicsGround.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        physicsGround.position.x = frame.maxX / 2
        physicsGround.position.y =  -physicsGround.frame.minY / 2
        physicsGround.physicsBody = SKPhysicsBody(rectangleOf: physicsGround.size)
        physicsGround.physicsBody?.affectedByGravity = false
        
        addChild(physicsGround)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not suppoerted")
    }
}

class GroundNode: SKSpriteNode {
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        
        let pisoBaixo = SKSpriteNode(texture: SKTexture(image: UIImage(named: "PisoBaixo")!), color: .clear, size: CGSize(width: size.width, height: size.height * 0.6))
        pisoBaixo.anchorPoint = .zero
        pisoBaixo.position = .zero
        pisoBaixo.zPosition = -1
        pisoBaixo.name = "pisoBaixo"
        
        let pisoAlto = SKSpriteNode(texture: SKTexture(image: UIImage(named: "PisoAlto")!), color: .clear, size: CGSize(width: size.width, height: size.height * 0.4))
        pisoAlto.anchorPoint = .zero
        pisoAlto.position = CGPoint(x: 0, y: pisoBaixo.frame.maxY - 5)
        pisoAlto.zPosition = -2
        pisoAlto.name = "pisoAlto"
        
        addChild(pisoBaixo)
        addChild(pisoAlto)
        
        anchorPoint = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
}

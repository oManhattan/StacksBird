//
//  GameScene.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import SpriteKit
import GameKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var backgroundNode: BackgroundNode?
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.scene?.anchorPoint = .zero
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        let background = BackgroundNode(size: frame.size)
        addChild(background)
        
        let player = PlayerNode()
        player.position = CGPoint(x: 100, y: frame.midY)
        player.machineState.enter(PlayerMovingState.self)
        addChild(player)
        
        if let imageButton = UIImage(named: "playButton") {
            let pauseButton = ButtonNode(body: SKSpriteNode(texture: SKTexture(image: imageButton), color: .clear, size: CGSize(width: 100, height: 50))) {
                print("funfou")
            }
            pauseButton.body.anchorPoint = CGPoint(x: 0, y: 0)
            pauseButton.position = CGPoint(x: 10, y: 10)
            pauseButton.zPosition = 3
            pauseButton.name = "pauseButton"
            addChild(pauseButton)
        }
        
        self.backgroundNode = background
        self.backgroundNode?.machineState.enter(BackgroundMovingState.self)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.backgroundNode?.machineState.currentState?.nextState()
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        guard let button = childNode(withName: "pauseButton") else { return }
        guard let playerNode = childNode(withName: "playerNode") as? PlayerNode else { return }
        playerNode.machineState.enter(PlayerJumpState.self)
    }
    
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override func didMove(to view: SKView) {
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let playerNode = childNode(withName: "playerNode") as? PlayerNode else { return }
        playerNode.machineState.enter(PlayerMovingState.self)
        print("correndo")
        
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        print("pulando")
    }
}

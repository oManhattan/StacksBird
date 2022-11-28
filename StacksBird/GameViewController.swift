//
//  GameViewController.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    private var mainGameScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Frame width: \(view.frame.width) | heigth: \(view.frame.height)")
        
        if let view = self.view as? SKView {
            let scene = GameScene(size: CGSize.toLandscape(view.frame.width, view.frame.height))
            scene.scaleMode = .aspectFit
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
            
            self.mainGameScene = scene
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

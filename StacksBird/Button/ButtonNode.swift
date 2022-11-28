//
//  ButtonNode.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 26/11/22.
//

import Foundation
import SpriteKit

class ButtonNode: SKNode {
    
    var body: SKSpriteNode
    var action: (() -> Void)?
    
    init(body: SKSpriteNode, action: @escaping () -> Void) {
        self.body = body
        self.action = action
        super.init()
        self.addChild(body)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.action?()
    }
}

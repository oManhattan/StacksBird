//
//  Extensions+Classes.swift
//  StacksBird
//
//  Created by Matheus Cavalcanti de Arruda on 22/11/22.
//

import Foundation
import GameKit

extension CGFloat {
    static func higherLower(_ n1: Self, _ n2: Self) -> (Self, Self) {
        let max = (n1 > n2) ? n1 : n2
        let min = (n1 < n2) ? n1 : n2
        return (max, min)
    }
}

extension CGSize {
    static func toLandscape(_ n1: CGFloat, _ n2: CGFloat) -> Self {
        let (max, lower) = CGFloat.higherLower(n1, n2)
        return .init(width: max, height: lower)
    }
}

extension GKState {
    @objc func nextState() {
        
    }
}

extension SKSpriteNode {
    func addChildren(_ children: [SKSpriteNode]) {
        children.forEach({addChild($0)})
    }
}

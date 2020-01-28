//
//  GameScene.swift
//  FlappyBirds
//
//  Created by ricardo.s.rachaus on 28/01/20.
//  Copyright © 2020 Rachaus. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var sprite: SKSpriteNode

    override init(size: CGSize) {
        sprite = SKSpriteNode(imageNamed: <#T##String#>)
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        print("Hello World")
    }

}

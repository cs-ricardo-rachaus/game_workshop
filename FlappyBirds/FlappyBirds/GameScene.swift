//
//  GameScene.swift
//  FlappyBirds
//
//  Created by ricardo.s.rachaus on 28/01/20.
//  Copyright © 2020 Rachaus. All rights reserved.
//

import SpriteKit
import GameplayKit

let birdMask: UInt32 = 0x001
let worldMask: UInt32 = 0x010
let pipeMask: UInt32 = 0x100

class GameScene: SKScene, SKPhysicsContactDelegate {

    func didBegin(_ contact: SKPhysicsContact) {
        sprite.alpha = 0.2
    }

    var sprite: SKSpriteNode

    override init(size: CGSize) {
        sprite = SKSpriteNode(imageNamed: "bird-01")
        super.init(size: size)

        sprite.position = CGPoint(x: size.width / 2, y: size.height / 2)
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: sprite.size.width / 2)
        sprite.setScale(3)
        addChild(sprite)
        loadAnimation()

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = CGVector(dx: 0, dy: -0.5)
        physicsWorld.contactDelegate = self

        physicsBody?.categoryBitMask = worldMask
        physicsBody?.contactTestBitMask = birdMask
        physicsBody?.collisionBitMask = birdMask

        sprite.physicsBody?.categoryBitMask = birdMask
        sprite.physicsBody?.contactTestBitMask = worldMask & pipeMask
        sprite.physicsBody?.collisionBitMask = worldMask
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func loadAnimation() {
        let texturesNames = ["bird-01", "bird-02", "bird-03", "bird-04"]
        var textures: [SKTexture] = []
        for name in texturesNames {
            let texture = SKTexture(imageNamed: name)
            texture.filteringMode = .nearest
            textures.append(texture)
        }

        let animation = SKAction.animate(with: textures, timePerFrame: 0.2)
        let repeatForever = SKAction.repeatForever(animation)
        sprite.run(repeatForever)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if sprite.physicsBody!.velocity.dy < CGFloat(100) {
            sprite.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 5))
        }
    }

}

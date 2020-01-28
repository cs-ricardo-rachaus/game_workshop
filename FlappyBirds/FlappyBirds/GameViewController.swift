//
//  GameViewController.swift
//  FlappyBirds
//
//  Created by ricardo.s.rachaus on 28/01/20.
//  Copyright © 2020 Rachaus. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = view as? SKView
        let scene = GameScene(size: view.bounds.size)
        skView?.showsPhysics = true
        skView?.presentScene(scene)
    }

}

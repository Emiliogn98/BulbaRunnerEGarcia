//
//  GameViewController.swift
//  BulbaRunnerEGarcia
//
//  Created by Emilio García Navarrete on 27/05/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenu(size: CGSize(width: 2048, height: 1536))
        scene.scaleMode = .aspectFill
        let skView = view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.showsPhysics = true
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
     
        }
    }

     var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

     var prefersStatusBarHidden: Bool {
        return true
    }

//
//  MainMenu.swift
//  BulbaRunnerEGarcia
//
//  Created by Emilio García Navarrete on 28/05/23.
//

import SpriteKit

class MainMenu: SKScene {
    // MARK: propiedades
    
    var containerNode: SKSpriteNode!
    //MARK: sistema
    override func didMove(to view: SKView) {
        setupBG()
        setupGrounds()
        setupNodes()
    }
    override func update(_ currentTime: TimeInterval) {
        moveGrounds()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else {return}
        let node = atPoint(touch.location(in: self))
        
        if node.name == "play" {
         let scene = GameScene(size: size)
            scene.scaleMode = scaleMode
            view!.presentScene(scene, transition: .doorsOpenVertical(withDuration: 0.3))
          
        } else if node.name == "highscore" {
           setupPanel()
        } else if node.name == "setting" {
            setupSetting()
        } else if node.name == "container" {
            containerNode.removeFromParent()
        } else if node.name == "music" {
            let node = node as! SKSpriteNode
            effectEnabled = !effectEnabled
            node.texture = SKTexture(imageNamed: SKTAudio.musicEnabled ? "musicOn" : "musicOff")
        } else if node.name == "effect"{
            let node = node as! SKSpriteNode
            effectEnabled = !effectEnabled
            node.texture = SKTexture(imageNamed: effectEnabled ? "effectOn" : "effectOff")
        }
    }
}

//MARK: configuraciones

extension MainMenu {
    func setupBG(){
        let bgNode = SKSpriteNode(imageNamed: "background")
        bgNode.zPosition = -1.0
        bgNode.anchorPoint = .zero
        bgNode.position = .zero
        addChild(bgNode)
    }
    func setupGrounds(){
        for i in 0...2 {
            let  groundNode = SKSpriteNode(imageNamed: "ground")
            groundNode.name = "Ground"
            groundNode.anchorPoint = .zero
            groundNode.zPosition = 1.0
            groundNode.position = CGPoint(x: -CGFloat(i)*groundNode.frame.width, y: 0.0)
            addChild(groundNode)
        }
    }
    func moveGrounds() {
        enumerateChildNodes(withName: "ground") { (node, _) in
            let node = node as! SKSpriteNode
            node.position.x -= 8.0
            
            if node.position.x < -self.frame.width {
                node.position.x += node.frame.width*2.0
            }
            
        }
    }
    
    func setupNodes() {
        let title = SKSpriteNode(imageNamed: "title")
        title.name = "title"
        title.setScale(0.24)
     //   title.zPosition = 10.0
        title.zPosition = 1.0
//        title.position = CGPoint(x: size.width/2.0, y: size.height/2.5 + title.size.height - 50.0)
        title.position = CGPoint(x: 1160, y: 780)
        
        addChild(title)
        
        let bulba = SKSpriteNode(imageNamed: "bulba")
        bulba.name = "bulba"
        bulba.setScale(1.0)
        bulba.zPosition = 10.0
        bulba.position = CGPoint(x: size.width/2.0, y: size.height/2.5 + bulba.size.height - 50.0)
        addChild(bulba)
        
        let play = SKSpriteNode(imageNamed: "play")
        play.name = "play"
        play.setScale(0.40)
        play.zPosition = 10.0
        play.position = CGPoint(x: size.width/2.0, y: size.height/2.5 + play.size.height - 50.0)
        addChild(play)
        
        let highscore = SKSpriteNode(imageNamed: "highscore")
        highscore.name = "highscore"
        highscore.setScale(0.80)
        highscore.zPosition = 10.0
      //  highscore.position = CGPoint(x: size.width/2.0, y: size.height/2.0 - highscore.size.height - 50.0)
        highscore.position = CGPoint(x: size.width/2.0, y: size.height/2.2 - highscore.size.height - 50.0)
        addChild(highscore)
        
//        let setting = SKSpriteNode(imageNamed: "setting")
//        setting.name = "setting"
//        setting.setScale(0.85)
//        setting.zPosition = 10.0
//        setting.position = CGPoint(x: size.width/2.0, y: size.height/2.0 - setting.size.height - 50.0)
//        addChild(setting)
    }
    func setupPanel() {
        setupContainer()
        
        let panel = SKSpriteNode(imageNamed: "panel")
        panel.setScale(0.45)
        panel.zPosition = 20.0
        panel.position = .zero
        containerNode.addChild(panel)
        
        //highscore
        
        let x = -panel.frame.width/2.0 + 250.0
        let highscoreLbl = SKLabelNode(fontNamed: "Arial")
        highscoreLbl.text = "Highscore: \(ScoreGenerator.sharedInstance.getHighscore())"
        highscoreLbl.horizontalAlignmentMode = .left
        highscoreLbl.fontSize = 100.0
        highscoreLbl.zPosition = 25.0
        highscoreLbl.position = CGPoint(x: x, y: highscoreLbl.frame.height/2.0 - 30.0)
       // highscoreLbl.position = CGPoint(x: 700, y: 900)
        panel.addChild(highscoreLbl)
        
        let scoreLbl = SKLabelNode(fontNamed: "Arial")
        scoreLbl.text = "Score: \(ScoreGenerator.sharedInstance.getScore())"
        scoreLbl.horizontalAlignmentMode = .left
        highscoreLbl.fontSize = 50.0
        highscoreLbl.zPosition = 25.0
        highscoreLbl.position = CGPoint(x: x, y: scoreLbl.frame.height/2.0 - 30.0)
       // highscoreLbl.position = CGPoint(x: x, y: scoreLbl.frame.height/2.0 - 30.0)
        panel.addChild(scoreLbl)
        
        
    }
    func setupContainer() {
           containerNode = SKSpriteNode()
           containerNode.name = "container"
           containerNode.zPosition = 15.0
           containerNode.color = .clear //UIColor(white: 0.5, alpha: 0.5)
           containerNode.size = size
           containerNode.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
           addChild(containerNode)
    }
    func setupSetting(){
        setupContainer()
        
        //panel
        let panel = SKSpriteNode(imageNamed: "panel")
        panel.setScale(1.5)
        panel.zPosition = 20.0
        panel.position = .zero
        containerNode.addChild(panel)
        
        // musica
        let music = SKSpriteNode(imageNamed: SKTAudio.musicEnabled ?  "musicOn" : "musicOff")
        music.name = "music"
        music.setScale(0.7)
        music.zPosition = 25.0
        music.position = CGPoint(x: -music.frame.width - 50.0 , y: 0.0)
        panel.addChild(music)
        
        //sonidos
        let effect = SKSpriteNode(imageNamed: effectEnabled ? "effectOn" : "effectOff")
        effect.name = "effect"
        effect.setScale(0.7)
        effect.zPosition = 25.0
        effect.position = CGPoint(x: music.frame.width + 50.0 , y: 0.0)
        panel.addChild(effect)
    }
}

//
//  SKAction+Ext.swift
//  BulbaRunnerEGarcia
//
//  Created by Emilio García Navarrete on 28/05/23.
//

import SpriteKit

extension SKAction {
    
    class func playSoundFileNamed(_ fileNamed: String) -> SKAction{
        if !effectEnabled {return SKAction() }
        return SKAction.playSoundFileNamed(fileNamed, waitForCompletion: false)
    }
}

private let keyEffect = "keyEffect"

var effectEnabled: Bool = {
    return !UserDefaults.standard.bool(forKey: keyEffect)
}() {
    didSet {
        let value = !effectEnabled
        UserDefaults.standard.set(value, forKey: keyEffect)
        if value {
            SKAction.stop()
        }
    }
}

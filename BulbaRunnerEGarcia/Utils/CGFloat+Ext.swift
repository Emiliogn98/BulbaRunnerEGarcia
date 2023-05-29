//
//  CGFloat+Ext.swift
//  BulbaRunnerEGarcia
//
//  Created by Emilio García Navarrete on 27/05/23.
//

import CoreGraphics


public let π = CGFloat.pi
extension CGFloat{
    func radiansToDegrees() -> CGFloat{
        return self * 180.0 / π
    }
    func degreesToRadians() -> CGFloat{
        return self * π / 180.0
    }
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF)) // return 0 1
    }
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min // return min or max
    }
}

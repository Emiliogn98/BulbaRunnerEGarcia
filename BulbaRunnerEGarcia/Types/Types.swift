//
//  Types.swift
//  BulbaRunnerEGarcia
//
//  Created by Emilio García Navarrete on 27/05/23.
//

import Foundation
struct PhysicsCategory {
    static let Player:          UInt32 = 0b1    //1 - 00000001
    static let Block:            UInt32 = 0b10   //2 - 00000010
    static let Obstacle:           UInt32 = 0b100  //4 - 00000100
    static let Ground:           UInt32 = 0b1000 //8 - 000001000
    static let Candy:           UInt32 = 0b10000 //16 - 0000010000
}



//
//  SeedLiveScene.swift
//  BookCore
//
//  Created by Jose Joao Silva Nunes Alves on 14/05/20.
//

import UIKit
import PlaygroundSupport
import SpriteKit

public class SeedLiveScene: SKScene{
    
    var jarro: SKSpriteNode = SKSpriteNode(imageNamed: "jarro")
    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        self.addChild(jarro)
    }
    override public func didChangeSize(_ oldSize: CGSize) {
        
        jarro.position.x = self.size.width/2
        jarro.position.y = self.size.height/2 - 100
    }
}


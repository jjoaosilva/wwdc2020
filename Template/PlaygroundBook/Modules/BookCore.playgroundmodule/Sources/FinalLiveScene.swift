//
//  FinalLiveScene.swift
//  BookCore
//
//  Created by Jose Joao Silva Nunes Alves on 14/05/20.
//

import UIKit
import PlaygroundSupport
import SpriteKit

public class FinalLiveScene: SKScene{
    
    var filhote03: SKSpriteNode = SKSpriteNode(imageNamed: "filhote03")
    var label: SKLabelNode = SKLabelNode()
    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        label.text = "So, when you will plant yours?"
        
        self.addChild(label)
        self.addChild(filhote03)
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        label.position.x = self.size.width/2
        label.position.y = self.size.height/2 + 150
        label.fontSize = 40
        label.fontName = "\(label.fontName)-Bold"
        
        filhote03.position.x = self.size.width/2
        filhote03.position.y = self.size.height/2 - 150
    }
}


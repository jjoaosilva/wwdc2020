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
    var sun: SKShapeNode = SKShapeNode(circleOfRadius: 60)
    
    private func configure(){
        var cacto: CactisTypes?

        if let keyValue = PlaygroundKeyValueStore.current["cactoEnum"],
            case .integer(let cactuEnum) = keyValue {
            cacto = CactisTypes(rawValue: cactuEnum)
        }

        if let cactoType = cacto {
            switch cactoType {
            case .Mammillaria:
                self.filhote03 = SKSpriteNode(imageNamed: "especie013")
            case .CephalocereusSenilis:
                self.filhote03 = SKSpriteNode(imageNamed: "especie023")
            case .ChamaecereusSilvestrii:
                self.filhote03 = SKSpriteNode(imageNamed: "especie033")
            }
        }
    }
    
    override public func didMove(to view: SKView) {
        configure()
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        label.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        label.text = "So, when you will plant yours?"
        
        self.addChild(sun)
        self.addChild(label)
        self.addChild(filhote03)
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        sun.fillColor = #colorLiteral(red: 0.9529411764705882, green: 0.6862745098039216, blue: 0.13333333333333333, alpha: 1.0)
        sun.strokeColor = #colorLiteral(red: 0.9254901960784314, green: 0.23529411764705882, blue: 0.10196078431372549, alpha: 1.0)
        
        let scaleOut = SKAction.scale(to: 0.8, duration: 1.5)
        let scaleIn = SKAction.scale(to: 1, duration: 1.5)
        
        sun.position.x =  self.size.width/2
        sun.position.y =  self.size.width/2 + 600
        
        let repeatSun:SKAction = SKAction.repeatForever(SKAction.sequence([scaleOut, scaleIn]))
        
        sun.run(repeatSun)
        
        label.position.x = self.size.width/2
        label.position.y = self.size.height/2 + 150
        label.fontSize = 40
        label.fontName = "\(label.fontName)-Bold"
        
        filhote03.position.x = self.size.width/2
        filhote03.position.y = self.size.height/2 - 150
    }
}


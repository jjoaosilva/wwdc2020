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


//
//  SunLiveScene.swift
//  BookCore
//
//  Created by Jose Joao Silva Nunes Alves on 14/05/20.
//

import UIKit
import PlaygroundSupport
import SpriteKit

public class SunLiveScene: SKScene{
    
    var filhote02: SKSpriteNode = SKSpriteNode(imageNamed: "filhote02")
    var labelType: SKLabelNode = SKLabelNode()
    
    private func configure(){
        var cacto: CactisTypes?

        if let keyValue = PlaygroundKeyValueStore.current["cactoEnum"],
            case .integer(let cactuEnum) = keyValue {
            cacto = CactisTypes(rawValue: cactuEnum)
        }

        if let cactoType = cacto {
            switch cactoType {
            case .Mammillaria:
                self.filhote02 = SKSpriteNode(imageNamed: "especie012")
                labelType.text = "Mammillaria"
            case .CephalocereusSenilis:
                self.filhote02 = SKSpriteNode(imageNamed: "especie022")
                labelType.text = "Cephalocereus Senilis"
            case .ChamaecereusSilvestrii:
                self.filhote02 = SKSpriteNode(imageNamed: "especie032")
                labelType.text = "Chamaecereus Silvestrii"
            }
        }
    }
    
    override public func didMove(to view: SKView) {
        configure()
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        self.addChild(filhote02)
        self.addChild(labelType)
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        
        labelType.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        labelType.position.x = self.size.width/2
        labelType.position.y = self.size.height/8
        labelType.fontSize = 30
        labelType.fontName = "HelveticaNeue-Italic"
        
        filhote02.position.x = self.size.width/2
        filhote02.position.y = self.size.height/2 - 150
    }
}

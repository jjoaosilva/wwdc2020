
import UIKit
import PlaygroundSupport
import SpriteKit

public class IntroductionScene: SKScene{
    
    var label: SKLabelNode = SKLabelNode()
    var image: SKSpriteNode = SKSpriteNode(imageNamed: "exportCactos2")
    var subTitle: SKLabelNode = SKLabelNode()

    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        label.text = "Why do I love cacti?"
        subTitle.text = "An overview of why you will also love it!"
        label.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        subTitle.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        self.addChild(label)
        self.addChild(subTitle)
        self.addChild(image)
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        label.position.x = self.size.width/2
        label.position.y = self.size.height/2 + 150
        label.fontSize = 50
        label.fontName = "\(label.fontName)-Bold"
        
        subTitle.position.x = self.size.width/2
        subTitle.position.y = label.position.y - 50
        subTitle.fontSize = 25
        subTitle.fontName = "\(subTitle.fontName)-Bold"
        
        image.position.x = self.size.width/2
        
        image.position.y = self.size.height/2 - 100
    
    }
}

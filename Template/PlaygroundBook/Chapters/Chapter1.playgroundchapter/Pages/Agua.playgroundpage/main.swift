//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # Your cactus is strong but not invincible! 🌧
 
Of course, cacti are more resistant to water shortages! Its leaves have evolved into thorns to reduce perspiration, usually they grow horizontally to make more use of the water that accumulates in the soil and still manage to reproduce both by seeds and by cuttings !!! But one thing that doesn't change is: YES IT NEEDS WATER!
 
In this case, you will have the option: Today are you going to give water to your cactus or not?
 
  * Experiment:
  Let's water your cacti?
 
     1. Enter a value for the variable [`withWater`](glossary://withWater)
      2. Run the code
 
Now do you agree with me? Your cactus is strong but not invincible!
 */

//#-hidden-code
import UIKit
import PlaygroundSupport
import SpriteKit
import BookCore

class WaterViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let view = SKView()
        let scene = WaterScene()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        
        self.view = view
    }
}


public class WaterScene: SKScene{
    
    var filhote01: SKSpriteNode = SKSpriteNode(imageNamed: "especie011")
    var filhote02: SKSpriteNode = SKSpriteNode(imageNamed: "especie012")
    var dead: SKSpriteNode = SKSpriteNode(imageNamed: "dead")
    var seco: SKSpriteNode = SKSpriteNode(imageNamed: "seco")
    var labelType: SKLabelNode = SKLabelNode()
    
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
var withWater: Bool =  /*#-editable-code Do your choice*//*#-end-editable-code*/
    
//#-hidden-code

    var gota01: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var gota02: SKShapeNode = SKShapeNode(circleOfRadius: 5)
    var gota03: SKShapeNode = SKShapeNode(circleOfRadius: 8)
    var gota04: SKShapeNode = SKShapeNode(circleOfRadius: 5)
    
    var gota05: SKShapeNode = SKShapeNode(circleOfRadius: 10)
    var gota06: SKShapeNode = SKShapeNode(circleOfRadius: 5)
    var gota07: SKShapeNode = SKShapeNode(circleOfRadius: 8)
    var gota08: SKShapeNode = SKShapeNode(circleOfRadius: 5)
    
    private func configure(){
        var cacto: CactisTypes?

        if let keyValue = PlaygroundKeyValueStore.current["cactoEnum"],
            case .integer(let cactuEnum) = keyValue {
            cacto = CactisTypes(rawValue: cactuEnum)
        }

        if let cactoType = cacto {
            switch cactoType {
            case .Mammillaria:
                self.filhote01 = SKSpriteNode(imageNamed: "especie011")
                self.filhote02 = SKSpriteNode(imageNamed: "especie012")
                labelType.text = "Mammillaria"
            case .CephalocereusSenilis:
                self.filhote01 = SKSpriteNode(imageNamed: "especie021")
                self.filhote02 = SKSpriteNode(imageNamed: "especie022")
                labelType.text = "Cephalocereus Senilis"
            case .ChamaecereusSilvestrii:
                self.filhote01 = SKSpriteNode(imageNamed: "especie031")
                self.filhote02 = SKSpriteNode(imageNamed: "especie032")
                labelType.text = "Chamaecereus Silvestrii"
            }
        }
    }
    
    override public func didMove(to view: SKView) {
        configure()
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        
        if(withWater){
            self.gota01.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota01.lineWidth = 0
            
            self.gota02.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota02.lineWidth = 0
            
            self.gota03.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota03.lineWidth = 0
            
            self.gota04.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota04.lineWidth = 0
            
            self.gota05.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota05.lineWidth = 0
            
            self.gota06.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota06.lineWidth = 0
            
            self.gota07.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota07.lineWidth = 0
            
            self.gota08.fillColor = #colorLiteral(red: 0.4745098039215686, green: 0.8392156862745098, blue: 0.9764705882352941, alpha: 1.0)
            self.gota08.lineWidth = 0
            
            self.addChild(filhote02)
            self.addChild(filhote01)
            
            self.addChild(gota01)
            self.addChild(gota02)
            self.addChild(gota03)
            self.addChild(gota04)
            self.addChild(gota05)
            self.addChild(gota06)
            self.addChild(gota07)
            self.addChild(gota08)
        } else {
            self.addChild(dead)
            self.addChild(seco)
        }
        
        self.addChild(labelType)
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        labelType.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        labelType.position.x = self.size.width/2
        labelType.position.y = self.size.height/8
        labelType.fontSize = 30
        labelType.fontName = "HelveticaNeue-Italic"
        
        if(withWater){
            gota01.position.x = self.size.width
            gota01.position.y = self.size.height
            
            gota02.position.x = self.size.width
            gota02.position.y = self.size.height
            
            gota03.position.x = self.size.width
            gota03.position.y = self.size.height
            
            gota04.position.x = self.size.width
            gota04.position.y = self.size.height
            
            gota05.position.x = self.size.width
            gota05.position.y = self.size.height
            
            gota06.position.x = self.size.width
            gota06.position.y = self.size.height
            
            gota07.position.x = self.size.width
            gota07.position.y = self.size.height
            
            gota08.position.x = self.size.width
            gota08.position.y = self.size.height
            
            let x = self.size.width
            let y = self.size.height
            
            let goOrigin = SKAction.move(to: CGPoint(x: x, y: y), duration: 0)
            
            let goDown01 = SKAction.move(to:CGPoint(x: -10, y: -10), duration: 2.5)
            let goDown02 = SKAction.move(to:CGPoint(x: x/2, y: -10), duration: 2.5)
            let goDown03 = SKAction.move(to:CGPoint(x: -10, y: (y/2)-20), duration: 3)
            let goDown04 = SKAction.move(to:CGPoint(x: -20, y: (y/2)-100), duration: 2.5)
            
            let goDown05 = SKAction.move(to:CGPoint(x: -10, y: -10), duration: 4.5)
            let goDown06 = SKAction.move(to:CGPoint(x: x/2, y: -10), duration: 4.5)
            let goDown07 = SKAction.move(to:CGPoint(x: -10, y: (y/2)-20), duration: 5)
            let goDown08 = SKAction.move(to:CGPoint(x: -20, y: (y/2)-100), duration: 4.5)
            
            let sequence01 = SKAction.sequence([goOrigin, goDown01, goOrigin, goDown01])
            let sequence02 = SKAction.sequence([goOrigin, goDown02, goOrigin, goDown02])
            let sequence03 = SKAction.sequence([goOrigin, goDown03, goOrigin, goDown03])
            let sequence04 = SKAction.sequence([goOrigin, goDown04, goOrigin, goDown04])
            let sequence05 = SKAction.sequence([goOrigin, goDown05, goOrigin, goDown05])
            let sequence06 = SKAction.sequence([goOrigin, goDown06, goOrigin, goDown06])
            let sequence07 = SKAction.sequence([goOrigin, goDown07, goOrigin, goDown07])
            let sequence08 = SKAction.sequence([goOrigin, goDown08, goOrigin, goDown08])
            
            gota01.run(sequence01)
            gota02.run(sequence02)
            gota03.run(sequence03)
            gota04.run(sequence04)
            gota05.run(sequence05)
            gota06.run(sequence06)
            gota07.run(sequence07)
            gota08.run(sequence08)
            
            
            filhote01.position.x = self.size.width/2
            filhote01.position.y = self.size.height/2 - 100
            
            filhote02.position.x = self.size.width/2
            filhote02.position.y = self.size.height/2 - 80
            
            let fadeOut = SKAction.fadeOut(withDuration: 2)
            
            filhote02.run(fadeOut)
            
            let fadeIn = SKAction.fadeIn(withDuration: 2)
            
            filhote01.run(fadeOut)
            
            let finish: SKAction = SKAction.run {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Good job!!! [Next Page](@next)")
            }
                    
            let seq:SKAction = SKAction.sequence( [ fadeIn, finish ])
             
            filhote02.run(seq)
            
            
            
        }else{
            
            let y = self.size.height/2 - 100
            let finalX = self.size.width + 200
            
            dead.position.x = self.size.width/2
            dead.position.y = y
            
            seco.position.x = -100
            seco.position.y = y + 300
            
            let scaleOut = SKAction.scale(to: 0.5, duration: 0)
            
            let horRevolution:SKAction = SKAction.rotate(byAngle: -CGFloat.pi, duration: 10)
            
            let repeatRotationHr:SKAction = SKAction.repeatForever(horRevolution)
            
            let move = SKAction.move(to:CGPoint(x: finalX, y: y+300), duration:10)
            
            let finish: SKAction = SKAction.run {
                PlaygroundPage.current.assessmentStatus = .fail(hints: ["Look at the variable `withWater`. If it's false, your cactus will die."], solution: "You can try: `var withWater: Bool = true`")
            }
            
            seco.run(repeatRotationHr)
            seco.run(SKAction.sequence([scaleOut, move, finish]))
        }
    }
}

// Present the view controller in the Live View window

PlaygroundPage.current.liveView = WaterViewController()

//#-end-hidden-code

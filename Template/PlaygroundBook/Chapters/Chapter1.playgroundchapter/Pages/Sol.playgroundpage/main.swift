//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # That sun that we like! 🌞
 
It is indisputable: like any other plant, cacti need sun. The difference that few people know is that each species requires a different amount of sun. For example, Mammillaria asks for a lot of sun, Chamaecereus Silvestrii must be created in half shade, that is, it does not need to stay 100% of the day in a sunny place. With the right care, your cactus can reach 200 years of age (creating family heirlooms) and reach 20 meters in height!
 
 In this case, you will have the option: Today are you going to sunbathe or not?
 
  * Experiment:
 Let's get a tan?
 
     1. Enter a value for the variable [`withSun`](glossary://withSun)
     2. Run the code
 
    Sun in the right amount is the right way!
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
import SpriteKit
import BookCore


class SunViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let view = SKView()
        let scene = SunScene()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        
        self.view = view
    }
}


public class SunScene: SKScene{
    
    var filhote02: SKSpriteNode = SKSpriteNode(imageNamed: "filhote02")
    var filhote03: SKSpriteNode = SKSpriteNode(imageNamed: "filhote03")
    var dead: SKSpriteNode = SKSpriteNode(imageNamed: "dead")
    var nuvem: SKSpriteNode = SKSpriteNode(imageNamed: "nuvem")
    var sun: SKShapeNode = SKShapeNode(circleOfRadius: 60)
    var labelType: SKLabelNode = SKLabelNode()
//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, true, false)
    
var withSun: Bool =  /*#-editable-code Do your choice*//*#-end-editable-code*/
    
//#-hidden-code
    override public func didMove(to view: SKView) {
        configure()
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        self.addChild(filhote02)
        self.addChild(sun)
        
        if(withSun){
            self.addChild(filhote03)
        } else {
            self.addChild(dead)
            self.addChild(nuvem)
        }
        
        self.addChild(labelType)
    }
    
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
                self.filhote03 = SKSpriteNode(imageNamed: "especie013")
            case .CephalocereusSenilis:
                self.filhote02 = SKSpriteNode(imageNamed: "especie022")
                self.filhote03 = SKSpriteNode(imageNamed: "especie023")
            case .ChamaecereusSilvestrii:
                self.filhote02 = SKSpriteNode(imageNamed: "especie032")
                self.filhote03 = SKSpriteNode(imageNamed: "especie033")
            }
        }
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
        labelType.fontColor = #colorLiteral(red: 0.09019607843137255, green: 0.13333333333333333, blue: 0.0392156862745098, alpha: 1.0)
        labelType.position.x = self.size.width/2
        labelType.position.y = self.size.height/8
        labelType.fontSize = 30
        labelType.fontName = "HelveticaNeue-Italic"
        
        sun.fillColor = #colorLiteral(red: 0.9529411764705882, green: 0.6862745098039216, blue: 0.13333333333333333, alpha: 1.0)
        sun.strokeColor = #colorLiteral(red: 0.9254901960784314, green: 0.23529411764705882, blue: 0.10196078431372549, alpha: 1.0)
        
        let scaleOut = SKAction.scale(to: 0.8, duration: 1.5)
        let scaleIn = SKAction.scale(to: 1, duration: 1.5)
        
        sun.position.x =  self.size.width/2
        sun.position.y =  self.size.width/2 + 600
        
        sun.run(SKAction.sequence([scaleOut, scaleIn, scaleOut, scaleIn, scaleOut, scaleIn]))
        
        let x = self.size.width
        let y = self.size.height
        
        filhote02.position.x = x/2
        filhote02.position.y = y/2 - 150
        
        let fadeOut = SKAction.fadeOut(withDuration: 3.5)
        
        let fadeIn = SKAction.fadeIn(withDuration: 3.5)
        
        if(withSun){
            filhote03.position.x = x/2
            filhote03.position.y = self.size.height/2 - 60
            
            filhote03.run(SKAction.fadeOut(withDuration: 0))
            
            let finish: SKAction = SKAction.run {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Good job!!! [Next Page](@next)")
            }
                    
            let seq:SKAction = SKAction.sequence( [ fadeIn, finish ])
            
            filhote02.run(fadeOut)
            filhote03.run(seq)
            
        }else{
            dead.position.x = x/2
            dead.position.y = y/2 - 180
            
            dead.run(SKAction.fadeOut(withDuration: 0))
            
            nuvem.position.x =  -100
            nuvem.position.y =  y/2 + 300
            
            let scaleCloud = SKAction.scale(to: 0.5, duration: 0)
            
            let moveCloud = SKAction.move(to:CGPoint(x: x/2, y: y/2 + 300), duration: 2.5)
            
            nuvem.run(SKAction.sequence([scaleCloud, moveCloud]))
            
            let finish: SKAction = SKAction.run {
                PlaygroundPage.current.assessmentStatus = .fail(hints: ["Look at the variable `withSun`. If it's false, your cactus will die."], solution: "You can try: `var withSun: Bool = true`")
            }
                    
            let seq:SKAction = SKAction.sequence( [ fadeIn, finish ])
            
            filhote02.run(fadeOut)
            dead.run(seq)
        }
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = SunViewController()
//#-end-hidden-code

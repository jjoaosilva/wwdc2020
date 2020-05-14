//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # Aquele solzinho que a gente gosta!
 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 
 
 Nesse caso, voce tera a opcao: Hoje voce vai tomar sol ou nao?
 
  * Experiment:
  Vamos regar nosso cacto?
 
     1. Insira um valor para a variável [`withSun`](glossary://withSun)
     2. Execute o programa e veja o que acontece!
 
    Agora voce concorda comigo? Seu cacto é forte mais nao invencivel!
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

//#-end-hidden-code
var withSun: Bool =  /*#-editable-code number of repetitions*/<#Insira aqui#>/*#-end-editable-code*/
//#-hidden-code

    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        self.addChild(filhote02)
        self.addChild(sun)
        
        if(withSun){
            self.addChild(filhote03)
        } else {
            self.addChild(dead)
            self.addChild(nuvem)
        }
    }
    
    override public func didChangeSize(_ oldSize: CGSize) {
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
            
            filhote02.run(fadeOut)
            filhote03.run(fadeIn)
        }else{
            dead.position.x = x/2
            dead.position.y = y/2 - 180
            
            dead.run(SKAction.fadeOut(withDuration: 0))
            
            nuvem.position.x =  -100
            nuvem.position.y =  y/2 + 300
            
            let scaleCloud = SKAction.scale(to: 0.5, duration: 0)
            
            let moveCloud = SKAction.move(to:CGPoint(x: x/2, y: y/2 + 300), duration: 2.5)
            
            nuvem.run(SKAction.sequence([scaleCloud, moveCloud]))
            
            filhote02.run(fadeOut)
            dead.run(fadeIn)
        }
        
        
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = SunViewController()

//#-end-hidden-code

//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # Pq nem todo cacto é o mesmo cacto!
 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 
 Escolhi a dedo 3 especies de cactus pra voce e ja os coloquei em um enumerator `CactisTypes`:
 
- `CactisTypes.Mammillaria`
- `CactisTypes.CephalocereusSenilis`
- `CactisTypes.ChamaecereusSilvestrii`
 
 Nesse caso, falarei aqui os nomes comuns das 3 especies e vou mandar ele escolger uma das sementes para o plantio.
 

 
  * Experiment:
  Vamos escolher nossa semente?
 
     1. Insira um valor para a variável [`seed`](glossary://CactusType)
     2. Execute o programa
 
     Uau! Agora temos nosso proprio Cactu!!

 */


//#-hidden-code

import UIKit
import PlaygroundSupport
import SpriteKit
import BookCore


class SeedViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup(){
        let view = SKView()
        let scene = SeedScene()
        scene.scaleMode = .resizeFill
        view.presentScene(scene)
        
        self.view = view
    }
}


public class SeedScene: SKScene{
    
    var semente: SKSpriteNode = SKSpriteNode(imageNamed: "semente")
    var jarro: SKSpriteNode = SKSpriteNode(imageNamed: "jarro")
    
    override public func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.9764705882352941, green: 0.8509803921568627, blue: 0.5490196078431373, alpha: 1.0)
        
        self.addChild(jarro)
        self.addChild(semente)
    }
    override public func didChangeSize(_ oldSize: CGSize) {
        semente.position.x = self.size.width/2
        semente.position.y = self.size.height/2 + 400
        
        jarro.position.x = self.size.width/2
        jarro.position.y = self.size.height/2 - 100
        
        let sementePosFinal = CGPoint(x: self.size.width/2, y: self.size.width/2 + 160)
        
        let scaleZero = SKAction.scale(to: 0, duration: 0)
        let fadeIn = SKAction.scale(to: 1, duration: 0.5)
        let move = SKAction.move(to: sementePosFinal, duration: 2)
        let sequence = SKAction.sequence([scaleZero, fadeIn, move])
        
        semente.run(sequence)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = SeedViewController()
//#-end-hidden-code

//#-code-completion(identifier, show, setup())
var seed: CactisTypes = /*#-editable-code number of repetitions*/<#T##Tipo do cacto##CactisTypes#>/*#-end-editable-code*/

//#-code-completion(identifier, show, .Mammillaria`)
//#-code-completion(identifier, show, .CephalocereusSenilis)
//#-code-completion(identifier, show, .ChamaecereusSilvestrii)

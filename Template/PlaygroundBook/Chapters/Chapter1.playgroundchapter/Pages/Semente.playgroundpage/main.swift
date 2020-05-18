//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # Because not every cactus is the same cactus! 🌱
 
So, I could just tell you that cacti are plants from desert regions, dry places where other plants find it difficult to survive. Yeah, I think I already said but ... this is not the focus! The focus is that there are more than 1600 species or types of cacti around the world!
 
 I hand-picked three species of cacti for you and have already put them in a `CactisTypes` enumerator:
 
- `CactisTypes.Mammillaria`
- `CactisTypes.CephalocereusSenilis`
- `CactisTypes.ChamaecereusSilvestrii`
 
Each of these species has a characteristic. Mammillaria, known as the pin cushion, grows very little, reaching only 10cm in height, while Cephalocereus Senilis, known as old man beard, has large amounts of white hair, hence the name. And finally Chamaecereus Silvestrii, known as Peanut Cactus, grows on branches, so it needs a bigger jar and is great if you want to see changes in the spring, its flowers are beautiful!
 
 
  * Experiment:
     Let's choose our seed?
 
     1. Enter a value for the variable [`seed`](glossary://CactusType)
     2. Run the code
 
    Wow!! Now we have our own Cactus !!
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
//#-end-hidden-code
    
    //#-code-completion(everything, hide)
    //#-code-completion(identifier, show, ., Mammillaria, CephalocereusSenilis, ChamaecereusSilvestrii)
    //#-code-completion(identifier, show, setup())
var seed: CactisTypes = /*#-editable-code Cactus Type*//*#-end-editable-code*/
//#-hidden-code
    
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
        
        let sementePosFinal = CGPoint(x: self.size.width/2, y: self.size.height/2)
        
        let finish: SKAction = SKAction.run {
            PlaygroundPage.current.assessmentStatus = .pass(message: "Good job!!! [Next Page](@next)")
        }
        
        let scaleZero = SKAction.scale(to: 0, duration: 0)
        let fadeIn = SKAction.scale(to: 1, duration: 0.5)
        let move = SKAction.move(to: sementePosFinal, duration: 2)
        let sequence = SKAction.sequence([scaleZero, fadeIn, move, finish])
        
        semente.run(sequence)
        
        PlaygroundKeyValueStore.current["cactoEnum"] = .integer(seed.rawValue)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = SeedViewController()

//#-end-hidden-code

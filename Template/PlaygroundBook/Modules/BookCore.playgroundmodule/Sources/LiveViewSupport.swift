//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport
import SpriteKit
/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `LiveViewController` from `LiveView.storyboard`.
public func instantiateLiveView() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? LiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}

public func IntroductionLiveView() -> PlaygroundLiveViewable{
    let view = SKView()
    let scene = IntroductionScene()
    scene.scaleMode = .resizeFill
    view.presentScene(scene)
    
    return view
}

public func WaterLiveView() -> PlaygroundLiveViewable{
    let view = SKView()
    let scene = WaterLiveViewScene()
    scene.scaleMode = .resizeFill
    view.presentScene(scene)
    
    return view
}

public func SeedLiveView() -> PlaygroundLiveViewable{
    let view = SKView()
    let scene = SeedLiveScene()
    scene.scaleMode = .resizeFill
    view.presentScene(scene)
    
    return view
}

public func SunLiveView() -> PlaygroundLiveViewable{
    let view = SKView()
    let scene = SunLiveScene()
    scene.scaleMode = .resizeFill
    view.presentScene(scene)
    
    return view
}

public func FinalLiveView() -> PlaygroundLiveViewable{
    let view = SKView()
    let scene = FinalLiveScene()
    scene.scaleMode = .resizeFill
    view.presentScene(scene)
    
    return view
}

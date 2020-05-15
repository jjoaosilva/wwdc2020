//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import BookCore
import PlaygroundSupport

// Instantiate a new instance of the live view from BookCore and pass it to PlaygroundSupport.

PlaygroundPage.current.assessmentStatus = .fail(hints: ["Look at the variable `seed`. It's the CactisTypes type"], solution: "You can try: `var seed: CactisTypes = .Mammillaria`")

PlaygroundPage.current.liveView = SeedLiveView()

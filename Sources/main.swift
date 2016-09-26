import CClutter
import Clutter


/// Create a rectangle of a given colour on the given stage.
func createRectOn(_ s: Stage, colour c: Color, x: Double = 128, y: Double = 128, width: Double = 256, height: Double = 128) -> Rectangle {
    var r = Rectangle(color: c)
    r.size = (width, height)
    r.position = (x, y)
    s.add(child: r)
    r.show()
    
    return r
}


// Main function

guard initialize() == .success else {
    fatalError("Could not initialise clutter.")
}

let black = Color(red: 0, green: 0, blue: 0, alpha: 255)
let stage = Stage()

stage.setSize(width: 512, height: 512)
stage.setBackground(color: black)

let red    = Color(red: 255, green: 0,   blue: 0,   alpha: 128 )
let green  = Color(red: 0,   green: 255, blue: 0,   alpha: 128 )
let blue   = Color(red: 0,   green: 0,   blue: 255, alpha: 128 )
let yellow = Color(red: 255, green: 255, blue: 0,   alpha: 128 )
let cyan   = Color(red: 0,   green: 255, blue: 255, alpha: 128 )
let purple = Color(red: 255, green: 0,   blue: 255, alpha: 128 )

let colours = [red, green, blue, yellow, cyan, purple]
let rectangles = colours.map { createRectOn(stage, colour: $0) }

stage.show()

main()

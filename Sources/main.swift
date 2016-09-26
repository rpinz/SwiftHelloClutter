import CClutter
import Clutter


/// Create a rectangle of a given colour on the given stage.
func createRectOn(_ s: Stage, colour c: Color, x: Double = 256, y: Double = 256, width: Double = 256, height: Double = 128, anchorX: Double = 128, anchorY: Double = 64) -> Rectangle {
    var r = Rectangle(color: c)
    r.setAnchorPoint(anchorX: gfloat(anchorX), anchorY: gfloat(anchorY))
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

//
// Hide clicked rectangles
//
stage.connect(event: .buttonPressEvent) { stage, event, _ in
    var x: gfloat = 0
    var y: gfloat = 0
    clutter_event_get_coords(event, &x, &y)
    let clicked = ActorRef(stage.getActorAtPos(pickMode: .all, x: CInt(x), y: CInt(y)))
    guard clicked.ptr != stage.ptr else { return }
    clicked.hide()
}

var scale = 0.0
var rotation = 0.0
let timeLine = Timeline(msecs: 60)

timeLine.setRepeat(count: -1)
timeLine.onNewFrame { _,_,_ in
    rotation += 0.3;
    scale += 0.01
    if scale > 1 { scale = 0 }
    let scaleAmount = scale.smoothStep2(0.5, 2.0)

    let n = rectangles.count
    for i in 0..<n {
        let r = rectangles[i]
        r.setRotationAngle(axis: .z_axis, angle: rotation * Double(n-i-1))
        r.setScale(scaleX: scaleAmount, scaleY: scaleAmount)
        if scale == 0 { r.show() }
    }
}
timeLine.start()

stage.show()

main()

import CClutter
import Clutter

guard initialize() == .success else {
    fatalError("Could not initialise clutter.")
}

let black = Color(red: 0, green: 0, blue: 0, alpha: 255)
let stage = Stage()

stage.setSize(width: 512, height: 512)
stage.setBackground(color: black)

let translucent_green = Color(red: 0, green: 255, blue: 0, alpha: 128)
let rect = Rectangle(color: translucent_green)

rect.setSize(width: 100, height: 100)
rect.setPosition(x: 100, y: 100)

stage.add(child: rect)

rect.show()
stage.show()

main()

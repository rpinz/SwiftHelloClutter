import CClutter
import Clutter

guard initialize() == .success else {
    fatalError("Could not initialise clutter.")
}

let black = Color(red: 0, green: 0, blue: 0, alpha: 255)
let stage = Stage()

stage.setSize(width: 512, height: 512)
stage.setBackground(color: black)
stage.show()

main()

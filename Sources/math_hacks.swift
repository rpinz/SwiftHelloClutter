//
//  math_hacks.swift
//  HelloClutter
//
//  Created by Rene Hexel on 26/9/16.
//
// This follows http://www.tuxradar.com/files/tut_clutter_mathhacks.h:
// A collection of quick and dirty maths hacks to let us do funky stuff with Clutter.
//
// Although we don't recommend these hacks for general use, to avoid questions being asked
// please feel free to use this code under the WTFPL (http://sam.zoy.org/wtfpl/COPYING)
//

extension Double {
    /// Clamp the receiver to the range minval...maxval.
    func clamped(_ minval: Double = 0.0, _ maxval: Double = 1.0) -> Double {
        guard self < maxval else { return maxval }
        guard self > minval else { return minval }
        return self
    }

    func hermite(_ value1: Double, _ value2: Double, tangent1: Double = 0, _ tangent2: Double = 0) -> Double {
        guard self != 0 else { return value1 }
        guard self != 1 else { return value2 }
        let squared = self * self
        let cubed = self * squared
        let result = (2 * value1 - 2 * value2 + tangent2 + tangent1) * cubed +
                     (3 * value2 - 3 * value1 - 2 * tangent1 - tangent2) * squared +
                     tangent1 * self + value1
        return result
    }

    func smoothStep(_ value1: Double, _ value2: Double) -> Double {
        let result = clamped().hermite(value1, value2)
        return result
    }
    
    func smoothStep2(_ value1: Double, _ value2: Double) -> Double {
        let result: Double
        let clamp = clamped()
        if clamp > 0.5 {
            let value = (clamp - 0.5) * 2
            result = value.hermite(value2, value1)
        } else {
            let value = clamp * 2
            result = value.hermite(value1, value2)
        }
        return result
    }
}

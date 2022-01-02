//
//  BaseGlyph.swift
//  iOS2-Vorgabe-Xcode12
//
//  Created by  on 03.11.21.
//

import Foundation
import SwiftUI

class BaseGlyph: Glyph{
    var size = 0.0
    var color = Color.black
    var center: Point = Center()
    var showDescription = false
    func path() -> Path{
        return Path()
    }
    var area: Double{
        return 0.0
    }
    var perimeter: Double{
        return 0.0
    }
}

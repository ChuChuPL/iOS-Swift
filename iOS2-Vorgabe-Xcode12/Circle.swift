//
//  Circle.swift
//  iOS2-Vorgabe-Xcode12
//
//  Created by  on 03.11.21.
//

import Foundation
import SwiftUI

class Circle: BaseGlyph{
    override var area: Double{
        return Double.pi*pow(size/2, 2)
    }
    override var perimeter: Double{
        return Double.pi*size
    }
    override func path() -> Path{
        return DrawHelper.pathForCircle(centerX: center.x, centerY: center.y, size: size)
    }
}

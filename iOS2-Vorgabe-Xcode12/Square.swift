//
//  Square.swift
//  iOS2-Vorgabe-Xcode12
//
//  Created by  on 03.11.21.
//

import Foundation
import SwiftUI

class Square: BaseGlyph{
    override var area: Double{
        return size*size
    }
    override var perimeter: Double{
        return size*4
    }
    override func path() -> Path{
        return DrawHelper.pathForSquare(centerX: center.x, centerY: center.y, size: size)
    }
}

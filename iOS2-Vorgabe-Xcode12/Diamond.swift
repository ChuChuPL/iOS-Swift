//
//  Diamond.swift
//  iOS2-Vorgabe-Xcode12
//
//  Created by  on 03.11.21.
//

import Foundation
import SwiftUI

class Diamond: BaseGlyph{
    override var area: Double{
        return pow(size, 2)/2
    }
    override var perimeter: Double{
        return sqrt(area)*4
    }
    override func path() -> Path{
        return DrawHelper.pathForDiamond(centerX: center.x, centerY: center.y, size: size)
    }
}

//
//  ConverterModel.swift
//  iOS4_Chu_Luedecke
//
//  Created by Linh Chu on 05.12.21.
//

import SwiftUI

struct ConverterModel {
    var eInP = 0.84295
    var eInD = 1.1223
    var euro = 100.00
    
    var pound: Double {
        get {
            euro * eInP
        }
        set {
            euro = newValue/eInP
        }
    }
    
    var dollar: Double {
        get {
            euro * eInD
        }
        set {
            euro = newValue/eInD
        }
    }
}

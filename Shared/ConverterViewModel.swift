//
//  ConverterViewModel.swift
//  iOS4_Chu_Luedecke
//
//  Created by Linh Chu on 05.12.21.
//

import SwiftUI

class ConverterViewModel: ObservableObject{
    @Published private var converter = ConverterModel()
    
    var eInD: Double {
        get {
            converter.eInD
        }
        set {
                converter.eInD = newValue
        }
    }
    
    var eInP: Double {
        get {
            converter.eInP
        }
        set {
                converter.eInP = newValue
        }
    }
    
    var euro: Double {
        get {
            converter.euro
        }
        set {
                converter.euro = newValue
        }
    }
    
    var pound: Double {
        get {
            converter.pound
        }
        set {
                converter.pound = newValue
        }
    }
    
    var dollar: Double {
        get {
            converter.dollar
        }
        set {
                converter.dollar = newValue
        }
    }
    
}

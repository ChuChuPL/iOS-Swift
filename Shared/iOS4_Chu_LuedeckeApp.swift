//
//  iOS4_Chu_LuedeckeApp.swift
//  Shared
//
//  Created by Linh Chu on 05.12.21.
//

import SwiftUI

@main
struct iOS4_Chu_LuedeckeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(converterViewModel: ConverterViewModel())
        }
    }
}

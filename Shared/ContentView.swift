//
//  ContentView.swift
//  Shared
//
//  Created by Linh Chu on 05.12.21.
//Quelle online exchange rates
/*ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml*/

import SwiftUI

struct ContentView: View {
    @ObservedObject var converterViewModel: ConverterViewModel
    var formatter = NumberFormatter()
    var formatter2 = NumberFormatter()
//    @State private var dollarInput: String = ""
//    @State private var poundInput: String = ""
    var body: some View {
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter2.minimumFractionDigits = 0
        formatter2.maximumFractionDigits = 10
        return VStack {
            Text("Current Rates").font(.title)
            HStack {
                Text("Rate 1.00 € → $")
                TextField("€", value:
                            $converterViewModel.eInD, formatter: formatter2).textFieldStyle(.roundedBorder)
            }
            HStack {
            Text("Rate 1.00 € → £")
            TextField("£", value:
                        $converterViewModel.eInP, formatter: formatter2).textFieldStyle(.roundedBorder)
            }
            
            Text("Currency Converter").font(.title)
            HStack {
                TextField("€", value:
                            $converterViewModel.euro, formatter: formatter).textFieldStyle(.roundedBorder)
                Text("€")
            }
            HStack {
                TextField("$", value:
                            $converterViewModel.dollar, formatter: formatter).textFieldStyle(.roundedBorder)
                Text("$")
            }
            HStack {
                TextField("£", value:
                            $converterViewModel.pound, formatter: formatter).textFieldStyle(.roundedBorder)
                Text("£")
            }
            Button(action: {
                let contentString = try? String(contentsOf: URL(string:"https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml")!, encoding: .utf8)
                let usdBounds = contentString?.range(of: "\"USD\" rate=\"")
                let usdEndIndex = contentString?.index( usdBounds!.upperBound, offsetBy: 6)
                let substring = contentString![usdBounds!.upperBound..<usdEndIndex!]
                if let value = Double(substring) {
                    converterViewModel.eInD = value
                }
                let gbpBounds = contentString?.range(of: "\"GBP\" rate=\"")
                let gbpEndIndex = contentString?.index( gbpBounds!.upperBound, offsetBy: 7)
                let substring2 = contentString![gbpBounds!.upperBound..<gbpEndIndex!]
                if let value = Double(substring2) {
                    converterViewModel.eInP = value
                }
            }) {
                Text("Get Online Exchange Rate")
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(converterViewModel: ConverterViewModel())
    }
}
    


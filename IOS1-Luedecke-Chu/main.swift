//
//  main.swift
//  IOS1-Luedecke-Chu
//
//  Created by  on 20.10.21.
//

import Foundation

func readDouble()-> Double{
    let inputA = readLine()
    if let actualInput1=inputA{
        
        let actualInput1conv=(Double)(actualInput1)
        
        // check if inputs are type double
        if let actualD=actualInput1conv{
            return actualD
        }
    }
    return 0.0
}
let line = """
Hello,
my name is "Rabbit".
See you in the garden!
""";
print(line);
//print(readDouble())
var comp1 = Complex()
print("Geben Sie den Realteil der komplexen Zahl ein")
comp1.real = readDouble()
print("Geben Sie den Imaginärteil der komplexen Zahl ein")
comp1.imaginaer = readDouble()
print("\(comp1.real) + \(comp1.imaginaer)i")
var comp2 = Complex()
comp2.real = 1.2
comp2.imaginaer = 2.4
let _ = comp1.incrementBy(complex: comp2)
print("\(comp1.real) + \(comp1.imaginaer)i")
comp1.incrementBy(real: 2.2)
comp1.incrementBy(imaginaer: 0.6)
print("\(comp1.real) + \(comp1.imaginaer)i")
var comp3 = Complex()
comp3.real = 0.5
comp3.imaginaer = 1.0
let _ = comp1.multiplyBy(complex: comp3)
print("\(comp1.real) + \(comp1.imaginaer)i")
let _ = comp1.rotateBy(winkel: Double.pi)
print("\(comp1.real) + \(comp1.imaginaer)i")
var comp4 = Complex()
comp4.real = 0.2
comp4.imaginaer = 0.9
print("\((comp1.plus(complex: comp4)).real) + \((comp1.plus(complex: comp4)).imaginaer)i")


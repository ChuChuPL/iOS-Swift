//
//  Complex.swift
//  IOS1-Luedecke-Chu
//
//  Created by  on 20.10.21.
//

import Foundation
class Complex{
    var real = 0.0
    var imaginaer = 0.0
    
    func incrementBy(real val: Double) {
        real += val
    }
    func incrementBy(imaginaer val: Double){
        imaginaer += val
    }
    func incrementBy(complex val: Complex) -> Complex{
        self.imaginaer += val.imaginaer
        self.real += val.real
        return self
    }
    
    func multiplyBy(complex val: Complex) -> Complex{
//        (a + b i) * (c + d i) = (ac-bd) + (ad+bc) i
        let r = self.real
        let i = self.imaginaer
        self.real = (self.real*val.real-self.imaginaer*val.imaginaer)
        self.imaginaer = (r*val.imaginaer+i*val.real)
        return self
    }
    func rotateBy(winkel val: Double) -> Complex{
        let winkelComp = Complex()
        winkelComp.real = cos(val)
        winkelComp.imaginaer = sin(val)
        return self.multiplyBy(complex: winkelComp)
    }
    func plus(complex val: Complex) -> Complex{
        let newComp = Complex()
        newComp.real = val.real + self.real
        newComp.imaginaer = val.imaginaer + self.imaginaer
        return newComp
    }
}


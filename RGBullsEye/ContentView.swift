//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Jonatha Pereira Lima on 17/06/19.
//  Copyright © 2019 Jonatha Pereira Lima. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert: Bool = false
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        return Int((1.0 - diff) * 100.0 + 0.5)
    }

    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: rTarget,
                                               green: gTarget,
                                               blue: bTarget))
                    Text("Match this color")
                }
                
                VStack {
                    Rectangle()
                        .foregroundColor(Color(red: rGuess,
                                               green: gGuess,
                                               blue: bGuess))
                    HStack {
                        HStack {
                            Text("R: \(Int(rGuess * 255.0))")
                            Text("G: \(Int(gGuess * 255.0))")
                            Text("B: \(Int(bGuess * 255.0))")
                        }
                    }
                }
                
            }
            
            Button(action: {
                self.showAlert = true
            }) {
                Text("Hit Me!")
            }
                .presentation($showAlert) {
                    Alert(title: Text("Your score"),
                          message: Text("\(computeScore())"))
            }
            
            ColorSlider(value: $rGuess, textColor: .red)
                .padding()
            
            ColorSlider(value: $gGuess, textColor: .green)
                .padding()
            
            ColorSlider(value: $bGuess, textColor: .blue)
                .padding()
        }
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
#endif

//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Jonatha Pereira Lima on 17/06/19.
//  Copyright © 2019 Jonatha Pereira Lima. All rights reserved.
//

import SwiftUI

struct ColorSlider : View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        
        HStack {
            Text("0").color(textColor)
            Slider(value: $value, from: 0.0, through: 1.0)
            Text("255").color(textColor)
        }
        
    }
    
}

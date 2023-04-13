//
//  SliderComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct SliderComponente: View {
    var titulo: String
    @Binding var medida: Double

    var body: some View {
        HStack {
            Text("\(titulo)")
                .font(.system(size: 14))
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
            
            Slider(value: $medida, in: 0...1)
                .tint(.accentColor)
        }
        
    }
}

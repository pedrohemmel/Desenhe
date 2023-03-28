//
//  SliderComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct SliderComponente: View {
    @Binding var opacidade: Double

    var body: some View {
        VStack {
            Slider(value: $opacidade, in: 0...1)
                .padding()
        }
    }
}

//
//  SliderComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct SliderComponente: View {
    @State private var opacidade = 0.5

    var body: some View {
        VStack {
            Text("nao sei como faz na tela toda")
                .padding()
                .background(.red)
                .opacity(opacidade)

            Slider(value: $opacidade, in: 0...1)
                .padding()
        }
    }
}

struct SliderComponente_Previews: PreviewProvider {
    static var previews: some View {
        SliderComponente()
    }
}

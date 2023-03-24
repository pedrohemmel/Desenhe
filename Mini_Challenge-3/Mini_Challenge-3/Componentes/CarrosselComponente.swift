//
//  CarrosseeComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct CarrosselComponente: View {
    var array = ["Pedro", "Rodrigao", "Cecilia", "Pintudinho", "Cec", "Sarah", "Danilo Santana"]
    var categoriaDesenhos: String
    
    private let alturaELarguraImagem = 100.0
    
    init(categoriaDesenhos: String) {
        self.categoriaDesenhos = categoriaDesenhos
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(categoriaDesenhos)")
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(15))],
                    spacing: 15,
                    content: {
                    ForEach(array, id: \.self) {nome in
                        Button {
                            print(nome)
                        } label: {
                            Image("post1")
                                .resizable()
                                .frame(width: self.alturaELarguraImagem, height: self.alturaELarguraImagem)
                        }
                    }
                })
            }
            .frame(height: self.alturaELarguraImagem)
            .padding(.horizontal, 10)
        }
        
    }
}

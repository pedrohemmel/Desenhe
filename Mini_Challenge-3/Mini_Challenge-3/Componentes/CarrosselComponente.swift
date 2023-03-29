//
//  CarrosseeComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct CarrosselComponente: View {
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var categoriaDesenhos: String
    @Binding var desenhos: [String]
    
    let larguraTela = UIScreen.main.bounds.size.width
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
                    ForEach(desenhos, id: \.self) { desenho in
                        Button {
                            self.desenhoSelecionado = desenho
                            self.imagemEstaSelecionada = true
                        } label: {
                            Image("post1")
                                .resizable()
                                .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                        }
                    }
                })
            }
            .frame(height: self.larguraTela * 0.2)
            .padding(.horizontal, 10)
        }
        
    }
}

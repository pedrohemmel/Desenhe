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
    @Binding var desenhos: [Desenho]
    
    let larguraTela = UIScreen.main.bounds.size.width
    var body: some View {
        VStack {
            HStack {
                Text("\(categoriaDesenhos)")
                    .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 25))
                    .foregroundColor(.accentColor)
                    .padding(10)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem(.fixed(15))],
                    spacing: 15,
                    content: {
                    ForEach(desenhos, id: \.id) { desenho in
                        Button {
                            self.desenhoSelecionado = desenho.nomeDiretorio
                            self.imagemEstaSelecionada = true
                        } label: {
                            Image("\(desenho.nomeDiretorioMiniatura)")
                                .resizable()
                                .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                                .cornerRadius(10)
                        }
                    }
                })
            }
            .frame(height: self.larguraTela * 0.2)
            .padding(.horizontal, 10)
        }
        
    }
}

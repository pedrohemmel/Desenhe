//
//  TelaFiltroEscolhidoView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI

struct CategoriaEscolhidaComponente: View {
    let itens = 1...50
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var filtroSelecionado: String
    @Binding var categorias: [Categoria]
    
    let larguraTela = UIScreen.main.bounds.size.width
    var body: some View {
        ScrollView {
            HStack {
                Text("\(self.filtroSelecionado)")
                    .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 25))
                    .foregroundColor(.accentColor)
                    .padding(10)
//                    .background(.secondary)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            LazyVGrid(columns: colunas, spacing: 10) {
                ForEach(self.categorias, id: \.id) { categoria in
                    if categoria.nomeCategoria == self.filtroSelecionado {
                        ForEach(categoria.desenhos, id: \.id) { desenho in
                            Button(action: {
                                self.desenhoSelecionado = "\(desenho.nomeDiretorio)"
                                self.imagemEstaSelecionada = true
                            }, label: {
                                Image("\(desenho.nomeDiretorio)")
                                    .resizable()
                                    .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                                    .cornerRadius(10)
                            })
                        }
                        
                    }
                }
            }
        }
    }
}

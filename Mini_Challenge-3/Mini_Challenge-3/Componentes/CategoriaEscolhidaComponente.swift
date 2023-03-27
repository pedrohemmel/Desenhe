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
    
    @Binding var acaoDismiss: DismissAction
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var filtroSelecionado: String
    
    var body: some View {
        ScrollView {
            HStack {
                Text("\(self.filtroSelecionado)")
                    .padding(10)
                    .background(.secondary)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            LazyVGrid(columns: colunas, spacing: 10) {
                ForEach(itens, id: \.self) { item in
                    Button(action: {
                        self.desenhoSelecionado = "\(item)"
                        self.imagemEstaSelecionada = true
                        self.acaoDismiss()
                    }, label: {
                        Image("post1")
                            .frame(width: 100, height: 100)
                    })
                    .cornerRadius(10)
                }
            }
        }
    }
}

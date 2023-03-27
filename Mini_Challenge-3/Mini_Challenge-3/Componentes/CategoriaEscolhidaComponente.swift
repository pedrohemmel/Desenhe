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
    
    @Binding var filtroSelecionado: String
    
    var body: some View {
        
        ScrollView {
            HStack {
                Text("\(self.filtroSelecionado)")
                    .padding(10)
                    .background(.secondary)
                    .cornerRadius(10)
                    .padding(.horizontal, 21)
                Spacer()
            }
            LazyVGrid(columns: colunas, spacing: 30) {
                ForEach(itens, id: \.self) { item in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.secondary)
                            .opacity(0.7)
                        
                        Text("Imagem \(item)")
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Title")
        .navigationBarTitleDisplayMode(.inline)
    }
}
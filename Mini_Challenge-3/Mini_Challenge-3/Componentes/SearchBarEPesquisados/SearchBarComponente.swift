//
//  SearchBarComponente.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 23/03/23.
//

import SwiftUI

struct SearchBarComponente: View {
    @Binding var textoPesquisa: String
    
    @Binding var filtroAberto: Bool
    @Binding var filtroSelecionado: String
    @Binding var textFieldEstaEditando: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                TextField("Pesquise aqui", text: $textoPesquisa)
                    .keyboardType(.default)
                    .disabled(self.textFieldEstaEditando)
            }
            .padding(UIDevice.current.userInterfaceIdiom == .phone ? 7 : 15)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.leading, 10)
            
            Button {
                self.textFieldEstaEditando.toggle()
                self.filtroAberto.toggle()
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .padding(7)
                    .padding(.trailing, 10)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

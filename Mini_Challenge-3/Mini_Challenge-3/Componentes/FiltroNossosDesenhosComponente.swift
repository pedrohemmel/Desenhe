//
//  FiltroNossosDesenhosComponente.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 24/03/23.
//

import SwiftUI

struct FiltroNossosDesenhosComponente: View {
    @Binding var categorias: [String]
    @Binding var filtroAberto: Bool
    @Binding var filtroSelecionado: String
    var body: some View {
        VStack {
            if filtroAberto {
                VStack {
                    ForEach(self.categorias, id: \.self) { categoria in
                        Button {
                            self.filtroSelecionado = categoria
                            self.filtroAberto = false
                        } label: {
                            VStack(alignment: .leading) {
                                Text(categoria)
                                    .foregroundColor(.white)
                                Divider()
                                    .background(.white)
                            }
                        }
                        .padding(.leading, 15)
                        
                    }
                }
                .padding([.top, .leading, .trailing], 10)
                .background(.black)
                .cornerRadius(10)
                .padding([.leading, .top] , 60)
                .padding(.trailing, 20)
                Spacer()
            }
        }
        .onChange(of: self.filtroSelecionado) { novoFiltroSelecionado in
            if novoFiltroSelecionado != "" {
                if !self.categorias.contains("Limpar filtro") {
                    self.categorias.append("Limpar filtro")
                    self.filtroAberto = false
                } else if novoFiltroSelecionado == "Limpar filtro" {
                    self.filtroSelecionado = ""
                    self.categorias.removeLast()
                    self.filtroAberto = false
                }
            }
        }
    }
}


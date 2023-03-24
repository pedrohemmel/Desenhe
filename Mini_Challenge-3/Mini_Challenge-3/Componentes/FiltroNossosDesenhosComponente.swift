//
//  FiltroNossosDesenhosComponente.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 24/03/23.
//

import SwiftUI

struct FiltroNossosDesenhosComponente: View {
    var categorias = ["Primeira", "Segunda", "Terceira", "Quarta", "Quinta", "Sexta"]
    @Binding var filtroAberto: Bool
    @Binding var filtroSelecionado: String
    var body: some View {
        VStack {
            if filtroAberto {
                VStack {
                    ForEach(self.categorias, id: \.self) { categoria in
                        Button {
                            self.filtroSelecionado = categoria
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
    }
}


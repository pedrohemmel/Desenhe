//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    var categorias = ["Primeira", "Segunda", "Terceira", "Quarta", "Quinta", "Sexta"]
    
    @State private var textoPesquisa = ""
    
    @State var filtroAberto = false
    @State var filtroSelecionado = ""
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarComponente(textoPesquisa: $textoPesquisa, filtroAberto: $filtroAberto, filtroSelecionado: $filtroSelecionado)
                ScrollView {
                    ForEach(self.categorias, id: \.self) { categoria in
                        CarrosselComponente(categoriaDesenhos: categoria)
                            .padding(.top, 5)
                    }
                }
            }
            FiltroNossosDesenhosComponente(filtroAberto: $filtroAberto, filtroSelecionado: $filtroSelecionado)
            
        }
        .navigationBarTitle(Text("Nossos Desenhos"), displayMode: .inline)
    }
}

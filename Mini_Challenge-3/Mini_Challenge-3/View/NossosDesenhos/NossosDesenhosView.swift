//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @State var imagemEstaSelecionada = false
    @State var desenhoSelecionado = ""
    
    @State var categorias = ["Primeira", "Segunda", "Terceira", "Quarta", "Quinta", "Sexta"]
    @State private var textoPesquisa = ""
    @State var filtroAberto = false
    @State var filtroSelecionado = ""
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ConfirmarDesenhoView(), isActive: self.$imagemEstaSelecionada, label: {})
            VStack {
                SearchBarComponente(
                    textoPesquisa: self.$textoPesquisa,
                    filtroAberto: self.$filtroAberto,
                    filtroSelecionado: self.$filtroSelecionado)
                
                if filtroSelecionado == "" {
                    ScrollView {
                        ForEach(self.$categorias, id: \.self) { categoria in
                            CarrosselComponente(
                                imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                desenhoSelecionado: self.$desenhoSelecionado,
                                categoriaDesenhos: categoria, desenhos: .constant(["Pedro", "Rodrigao", "Cecilia", "Pintudinho", "Cec", "Sarah", "Danilo Santana"]))
                                .padding(.top, 5)
                        }
                    }
                } else {
                    CategoriaEscolhidaComponente(
                        imagemEstaSelecionada: self.$imagemEstaSelecionada,
                        desenhoSelecionado: self.$desenhoSelecionado,
                        filtroSelecionado: self.$filtroSelecionado)
                }
            }
            FiltroNossosDesenhosComponente(categorias: self.$categorias, filtroAberto: self.$filtroAberto, filtroSelecionado: self.$filtroSelecionado)
        }
        .navigationBarTitle(Text("Nossos Desenhos"), displayMode: .inline)
    }
}

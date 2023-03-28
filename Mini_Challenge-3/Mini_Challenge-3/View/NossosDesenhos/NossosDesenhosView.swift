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
    @State var filtroSelecionado = ""
    @State var filtroAberto = false
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ConfirmarDesenhoView(dadosImagemSelecionada: .constant(Data()), desenhoSelecionado: $desenhoSelecionado), isActive: self.$imagemEstaSelecionada, label: {})
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
                                categoriaDesenhos: categoria, desenhos: .constant(["post1", "post12", "post13", "post14", "post15", "post16", "post17"]))
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

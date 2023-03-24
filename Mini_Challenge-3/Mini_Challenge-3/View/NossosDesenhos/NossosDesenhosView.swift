//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @State private var textoPesquisa = ""
    
    @State var filtroAberto = false
    @State var filtroSelecionado = ""
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarComponente(textoPesquisa: $textoPesquisa, filtroAberto: $filtroAberto, filtroSelecionado: $filtroSelecionado)
                Spacer()
            }
            FiltroNossosDesenhosComponente(filtroAberto: $filtroAberto, filtroSelecionado: $filtroSelecionado)
        }
        .navigationBarTitle(Text("Nossos Desenhos"), displayMode: .inline)
    }
}

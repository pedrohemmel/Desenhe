//
//  TesteTelaInicialView.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct TelaInicialView: View {
    @State var imagemEstaSelecionada = false
    @State var dadosImagemSelecionada = Data()
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: ConfirmarDesenhoView(dadosImagemSelecionada: $dadosImagemSelecionada, desenhoSelecionado: .constant("")), isActive: self.$imagemEstaSelecionada, label: {})
                VStack {
                    Spacer()
                    Text("Vamos Desenhar!")
                        .padding(.bottom, 5)
                    Text("Para começar...")
                        .padding(.bottom, 50)
                    
                    BotaoImportarImagemComponente(imagemEstaSelecionada: self.$imagemEstaSelecionada, dadosImagemSelecionada: self.$dadosImagemSelecionada)
                        .padding(.bottom, 15)
                    
                    BotaoMenuInicialComponente(destination: AnyView(NossosDesenhosView()), imageName: "rectangle.3.offgrid.fill", text: "Escolha um de nossos desenhos")
                        .padding(.bottom, 15)
                    
                    BotaoMenuInicialComponente(destination: AnyView(TelaInicialView()), imageName: "lightbulb", text: "     Me surpreenda")
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}

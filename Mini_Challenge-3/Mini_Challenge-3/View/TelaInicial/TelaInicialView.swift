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
    @State var desenhoSelecionado = ""
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("fundo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.larguraTela, height: self.alturaTela)
//                    .ignoresSafeArea()
                NavigationLink(destination: ConfirmarDesenhoView(dadosImagemSelecionada: $dadosImagemSelecionada, desenhoSelecionado: .constant("")), isActive: self.$imagemEstaSelecionada, label: {})
                VStack {
                    Spacer()
                    Text("Vamos Desenhar!")
                        .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 40))
                        .padding(.bottom, 5)
                        .foregroundColor(Color("texts"))
                    Text("Para começar...")
                        .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 20))
                        .padding(.bottom, 50)
                        .foregroundColor(Color("texts"))
                    
                    BotaoImportarImagemComponente(imagemEstaSelecionada: self.$imagemEstaSelecionada, dadosImagemSelecionada: self.$dadosImagemSelecionada)
                        .padding(.bottom, 15)
                        
                    
                    BotaoMenuInicialComponente(destination: AnyView(NossosDesenhosView()), imageName: "rectangle.3.offgrid.fill", text: "Escolha um de nossos desenhos")
                        .padding(.bottom, 15)
                      
                    
                    BotaoMenuInicialComponente(
                        destination: AnyView(ConfirmarDesenhoView(
                            dadosImagemSelecionada: .constant(Data()),
                            desenhoSelecionado: self.$desenhoSelecionado,
                            eMeSurpreenda: true)),
                        imageName: "lightbulb",
                        text: "     Me surpreenda")
                    Spacer()
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

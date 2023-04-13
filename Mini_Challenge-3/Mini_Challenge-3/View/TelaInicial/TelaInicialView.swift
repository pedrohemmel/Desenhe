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
    @State var referenciaDesenhoSelecionado = ""
    
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(
                    destination: ConfirmarDesenhoView(
                        dismissDasTelas: .constant({}),
                        dadosImagemSelecionada: $dadosImagemSelecionada,
                        desenhoSelecionado: .constant(""),
                        referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                        voltaParaTelaInicial: .constant(false)),
                    isActive: self.$imagemEstaSelecionada, label: {})
                VStack {
                    Spacer()
                    if UIDevice.current.userInterfaceIdiom == .phone{
                        Text("Vamos Desenhar!")
                            .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 40))
                            .padding(.bottom, 5)
                            .foregroundColor(.accentColor)
                        Text("Para começar...")
                            .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 20))
                            .padding(.bottom, 50)
                            .foregroundColor(.accentColor)
                    }else{
                        Text("Vamos Desenhar!")
                            .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 80))
                            .padding(.bottom, 5)
                            .foregroundColor(.accentColor)
                        Text("Para começar...")
                            .font(.custom("AveriaGruesaLibre-Regular", fixedSize: 40))
                            .padding(.bottom, 50)
                            .foregroundColor(.accentColor)
                    }
                    
                    BotaoImportarImagemComponente(imagemEstaSelecionada: self.$imagemEstaSelecionada, dadosImagemSelecionada: self.$dadosImagemSelecionada)
                        .padding(.bottom, 15)
                        
                    
                    BotaoMenuInicialComponente(destination: AnyView(NossosDesenhosView()), imageName: "rectangle.3.offgrid.fill", text: "Escolha um de nossos desenhos")
                        .padding(.bottom, 15)
                      
                    
                    BotaoMenuInicialComponente(
                        destination: AnyView(ConfirmarDesenhoView(
                            dismissDasTelas: .constant({}),
                            dadosImagemSelecionada: .constant(Data()),
                            desenhoSelecionado: self.$desenhoSelecionado,
                            referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                            voltaParaTelaInicial: .constant(true),
                            eMeSurpreenda: true)),
                        imageName: "lightbulb",
                        text: "     Me surpreenda")
                    Spacer()
                    Spacer()
                }
                .background(Image("fundo"))
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

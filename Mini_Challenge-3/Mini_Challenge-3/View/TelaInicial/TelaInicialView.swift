//
//  TesteTelaInicialView.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI
struct TelaInicialView: View {
    @State var paginaConfirmarDesenho = false
    @State var paginaNossosDesenhos = false
    @State var paginaTelaDesenhar = false
    @State var imagemEstaSelecionada = false
    @State var dadosImagemSelecionada = Data()
    @State var desenhoSelecionado = ""
    @State var referenciaDesenhoSelecionado = ""
    
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            ZStack {
                
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
                    
                    BotaoImportarImagemComponente(
                        paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                        paginaNossosDesenhos: self.$paginaNossosDesenhos,
                        paginaTelaDesenhar: self.$paginaTelaDesenhar,
                        imagemEstaSelecionada: self.$imagemEstaSelecionada,
                        dadosImagemSelecionada: self.$dadosImagemSelecionada,
                        desenhoSelecionado: self.$desenhoSelecionado,
                        referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado)
                        .padding(.bottom, 15)
                    
                    BotaoMenuInicialComponente(
                        paginaNossosDesenhos: self.$paginaNossosDesenhos,
                        paginaConfirmarDesenhos: self.$paginaConfirmarDesenho,
                        paginaEscolhida: "PND",
                        destination: AnyView(ControladorTelas(
                            paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                            paginaNossosDesenhos: self.$paginaNossosDesenhos,
                            paginaTelaDesenhar: self.$paginaTelaDesenhar,
                            imagemEstaSelecionada: self.$imagemEstaSelecionada,
                            dadosImagemSelecionada: self.$dadosImagemSelecionada,
                            desenhoSelecionado: self.$desenhoSelecionado,
                            referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                            eMeSurpreenda: false)),
                        image: Image(systemName: "rectangle.3.offgrid.fill"),
                        text: "Escolha um de nossos desenhos")
                        .padding(.bottom, 15)
                    
                    BotaoMenuInicialComponente(
                        paginaNossosDesenhos: self.$paginaNossosDesenhos,
                        paginaConfirmarDesenhos: self.$paginaConfirmarDesenho,
                        paginaEscolhida: "PCD",
                        destination: AnyView(ControladorTelas(
                            paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                            paginaNossosDesenhos: self.$paginaNossosDesenhos,
                            paginaTelaDesenhar: self.$paginaTelaDesenhar,
                            imagemEstaSelecionada: self.$imagemEstaSelecionada,
                            dadosImagemSelecionada: .constant(Data()),
                            desenhoSelecionado: self.$desenhoSelecionado,
                            referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                            eMeSurpreenda: true)),
                        image: Image(systemName: "lightbulb"),
                        text: "     Me surpreenda")
                    
                    Spacer()
                    Spacer()
                }
                .background(Image("fundo"))
            }
            .ignoresSafeArea()
        }
        .animation(nil, value: self.imagemEstaSelecionada)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

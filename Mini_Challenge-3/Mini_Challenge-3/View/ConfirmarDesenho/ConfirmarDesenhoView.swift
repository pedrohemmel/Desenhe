//
//  ConfirmarDesenhoView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI

struct ConfirmarDesenhoView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    
    @State var eDesenho: Bool? = nil
    @State var telaDesenharParametrizada: TelaDesenharView? = nil
    
    @State var eMeSurpreenda: Bool?
    @State var recebeuInfDesenho = false
    
    let confirmarDesenhoViewModel = ConfirmarDesenhoViewModel()
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                if self.eDesenho ?? false {
                    Image(self.desenhoSelecionado)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: larguraTela)
                    
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: larguraTela)
                    }
                }
                Spacer()
                HStack {
                    NavigationLink(destination: self.telaDesenharParametrizada, label: {
                        Text("Desenhar")
                            .foregroundColor(Color("texts"))
                            .padding(15)
                            .background(Color("buttonBackground"))
                            .cornerRadius(10)
                    })
                    .padding(.bottom, 40)
                    .padding(.trailing, 10)
                }
            }
            
        }
        .onAppear {
            self.eDesenho = self.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
            
            if eMeSurpreenda ?? false {
                self.confirmarDesenhoViewModel.buscarInfDesenho() {
                    self.recebeuInfDesenho = true
                    self.desenhoSelecionado = self.confirmarDesenhoViewModel.sortearDesenho()
                    self.eDesenho = self.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
                }
            }
            
            if eDesenho ?? false {
                self.telaDesenharParametrizada = TelaDesenharView(dadosImagemSelecionada: .constant(Data()), desenhoSelecionado: self.$desenhoSelecionado)
            } else {
                self.telaDesenharParametrizada = TelaDesenharView(dadosImagemSelecionada: self.$dadosImagemSelecionada, desenhoSelecionado: .constant(""))
            }
            
        }
        .background(.black)
        .navigationBarTitleDisplayMode(.inline)
    }
    func verificaImagemNula(dadosImagemSelecionada: Data?, desenhoSelecionado: String?) -> Bool {
        if desenhoSelecionado != "" {
            return true
        }
        return false
    }
}

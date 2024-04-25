//
//  ConfirmarDesenhoView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI

struct ConfirmarDesenhoView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @Binding var paginaConfirmarDesenho: Bool
    @Binding var paginaNossosDesenhos: Bool
    @Binding var paginaTelaDesenhar: Bool
    
    @Binding var dismissDasTelas: (() -> Void)
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    @Binding var imagemEstaSelecionada: Bool
    @Binding var referenciaDesenhoSelecionado: String
    
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
                        .frame(maxHeight: alturaTela / 1.5)
                        .padding(.top, self.alturaTela * 0.05)
                    
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: alturaTela / 1.5)
                            .padding(.top, self.alturaTela * 0.05)
                    }
                }
                Text("\(self.referenciaDesenhoSelecionado)")
                    .foregroundColor(Color(cgColor: CGColor(red: 150, green: 150, blue: 150, alpha: 0.3)))
                HStack {
                    Button {
                        self.paginaNossosDesenhos = false
                        self.paginaConfirmarDesenho = false
                        self.paginaTelaDesenhar = true
                    } label: {
                        Text("Desenhar")
                            .foregroundColor(Color("texts"))
                            .padding(15)
                            .background(Color("buttonBackground"))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 60)
                    .padding(.trailing, 10)
                    
                }
                
            }
            .frame(width: self.larguraTela)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    if let eMeSurpreenda = self.eMeSurpreenda {
                        if eMeSurpreenda {
                            self.desenhoSelecionado = ""
                            self.dadosImagemSelecionada = Data()
                            self.imagemEstaSelecionada = false
                            self.referenciaDesenhoSelecionado = ""
                            self.eMeSurpreenda = false
                            self.dismiss()
                        } else if !self.eDesenho! {
                            self.desenhoSelecionado = ""
                            self.dadosImagemSelecionada = Data()
                            self.imagemEstaSelecionada = false
                            self.referenciaDesenhoSelecionado = ""
                            self.eMeSurpreenda = false
                            self.dismiss()
                        } else {
                            self.desenhoSelecionado = ""
                            self.dadosImagemSelecionada = Data()
                            self.imagemEstaSelecionada = false
                            self.referenciaDesenhoSelecionado = ""
                            self.paginaTelaDesenhar = false
                            self.paginaConfirmarDesenho = false
                            self.paginaNossosDesenhos = true
                        }
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Voltar")
                    }
                    .foregroundColor(Color("corBotao"))
                }
            }
        }
        .onAppear {
            self.eDesenho = self.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
            
            if eMeSurpreenda! {
                self.confirmarDesenhoViewModel.buscarInfDesenho() {
                    self.recebeuInfDesenho = true
                    (self.desenhoSelecionado, self.referenciaDesenhoSelecionado) = self.confirmarDesenhoViewModel.sortearDesenho()
                    self.eDesenho = true
                }
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

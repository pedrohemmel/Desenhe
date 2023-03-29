//
//  TelaDesenharView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 28/03/23.
//

import SwiftUI
import AVFoundation

struct TelaDesenharView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    
    @State var eDesenho: Bool? = nil
    @State var estaTravado = false
    
    @State private var escalaZoom = 1.0
    @State private var opacidadeFundo = 0.5
    @State private var opacidadeImagem = 0.5
    
    @StateObject var cameraViewModel = ModoCameraViewModel()
    
    let telaDesenharViewModel = TelaDesenharViewModel()
    
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            ModoCameraRepresentable(cameraViewModel: self.cameraViewModel)
                .ignoresSafeArea(.all)
            Rectangle()
                .frame(width: larguraTela, height: alturaTela)
                .ignoresSafeArea(.all)
                .background(.white)
                .opacity(self.opacidadeFundo)
            
            VStack {
                if self.eDesenho ?? false {
                    Image(self.desenhoSelecionado)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: larguraTela)
                        .opacity(self.opacidadeImagem)
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: larguraTela)
                            .opacity(self.opacidadeImagem)
                    }
                }
            }
            
            if !self.estaTravado {
                VStack {
                    Spacer()
                    VStack {
                        SliderComponente(titulo: "Lupa", medida: self.$escalaZoom)
                        SliderComponente(titulo: "Imagem", medida: self.$opacidadeImagem)
                        SliderComponente(titulo: "Fundo", medida: self.$opacidadeFundo)
                    }
                    .padding()
                    .padding(.bottom, alturaTela * 0.1)
                    .opacity(0.8)
                    .onChange(of: escalaZoom) { escala in
                        self.telaDesenharViewModel.alterarZoom(escala: CGFloat(escala))
                    }
                }
                
            }
        }
        .onAppear {
            self.eDesenho = self.telaDesenharViewModel.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
        }
        .onAppear(perform: cameraViewModel.checarPermissao)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.estaTravado = !self.estaTravado
                } label: {
                    if !self.estaTravado {
                        Image(systemName: "lock.open.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color("texts"))
                    } else {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color("texts"))
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                if !self.estaTravado {
                    Button {
                        self.dismiss()
                    } label: {
                        Text("Concluir")
                            .fontWeight(.bold)
                            .foregroundColor(Color("texts"))
                    }
                }
            }
                
        }
    }
    
    
    
    
}

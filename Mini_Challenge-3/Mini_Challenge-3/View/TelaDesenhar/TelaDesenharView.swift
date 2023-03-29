//
//  TelaDesenharView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 28/03/23.
//

import SwiftUI
import AVFoundation

struct TelaDesenharView: View {
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    @State var eDesenho: Bool? = nil
    
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
                .background(.white)
                .opacity(self.opacidadeFundo)
            VStack {
                if self.eDesenho ?? false {
                    Image(self.desenhoSelecionado)
                        .resizable()
                        .frame(width: larguraTela, height: larguraTela)
                        .opacity(self.opacidadeImagem)
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: larguraTela, height: larguraTela)
                            .opacity(self.opacidadeImagem)
                    }
                }
            }
            VStack {
                
                SliderComponente(titulo: "Lupa", medida: self.$escalaZoom)
                SliderComponente(titulo: "Fundo", medida: self.$opacidadeFundo)
                SliderComponente(titulo: "Imagem", medida: self.$opacidadeImagem)
            }
            .padding()
            .background(.gray)
            .cornerRadius(10)
            .padding()
            .onChange(of: escalaZoom) { escala in
                self.telaDesenharViewModel.alterarZoom(escala: CGFloat(escala))
            }
            
        }
        .onAppear {
            self.eDesenho = self.telaDesenharViewModel.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
        }
        .onAppear(perform: cameraViewModel.checarPermissao)
    }
    
    
    
    
}

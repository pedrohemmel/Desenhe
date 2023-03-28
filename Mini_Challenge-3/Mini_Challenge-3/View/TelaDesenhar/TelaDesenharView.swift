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
    
    @State private var escalaZoom: CGFloat = 0.5
    @State private var opacidade = 0.5
    
    @StateObject var cameraViewModel = ModoCameraViewModel()
    
    let camera = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back)
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            ModoCameraRepresentable(cameraViewModel: self.cameraViewModel)
                .ignoresSafeArea(.all)
            Rectangle()
                .frame(width: larguraTela, height: alturaTela)
                .background(.white)
                .opacity(opacidade)
            VStack {
                if self.eDesenho ?? false {
                    Image(self.desenhoSelecionado)
                        .resizable()
                        .frame(width: larguraTela, height: larguraTela)
                        .opacity(self.opacidade)
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: larguraTela, height: larguraTela)
                            .opacity(self.opacidade)
                    }
                }
            }
            
            VStack {
                SliderComponente(opacidade: self.$opacidade)
            }
            
        }
        .onAppear {
            self.eDesenho = self.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
        }
        .onAppear(perform: cameraViewModel.checarPermissao)
    }
    
    func alterarZoom() {
        do {
            try camera?.lockForConfiguration()
            camera?.videoZoomFactor = escalaZoom
            camera?.unlockForConfiguration()
        } catch {
            print("Failed to update zoom: \(error.localizedDescription)")
        }
    }
    
    func verificaImagemNula(dadosImagemSelecionada: Data?, desenhoSelecionado: String?) -> Bool {
        if desenhoSelecionado != "" {
            return true
        }
        return false
    }
}


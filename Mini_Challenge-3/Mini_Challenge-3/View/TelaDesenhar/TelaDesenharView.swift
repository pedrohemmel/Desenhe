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
    
    @StateObject var cameraViewModel = ModoCameraViewModel()
    
    let camera = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back)
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            ModoCameraRepresentable(cameraViewModel: self.cameraViewModel)
                .ignoresSafeArea(.all)
            VStack {
                if self.eDesenho ?? false {
                    Image(self.desenhoSelecionado)
                        .resizable()
                        .frame(width: larguraTela, height: larguraTela)
                } else {
                    if let uiImage = UIImage(data: self.dadosImagemSelecionada) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: larguraTela, height: larguraTela)
                    }
                }
            }
            
            VStack {
                Image(systemName: "plus.magnifyingglass")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .onTapGesture {
                        if escalaZoom <= 1 {
                            escalaZoom += 0.1
                        }
                        
                        alterarZoom()
                    }
                Image(systemName: "minus.magnifyingglass")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .onTapGesture {
                        if escalaZoom >= 1 {
                            escalaZoom -= 0.1
                        }
                        
                        alterarZoom()
                    }
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


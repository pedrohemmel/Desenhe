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
                SliderComponente(titulo: "Opacidade", medida: self.$opacidade)
                SliderComponente(titulo: "Lupa", medida: self.$escalaZoom)
            }
            .onChange(of: escalaZoom) { escala in
                var novaEscala = 1 + 6 * (1 - escala)
                alterarZoom(escala: CGFloat(novaEscala))
            }
            
        }
        .onAppear {
            self.eDesenho = self.verificaImagemNula(dadosImagemSelecionada: self.dadosImagemSelecionada, desenhoSelecionado: self.desenhoSelecionado)
        }
        .onAppear(perform: cameraViewModel.checarPermissao)
    }
    
    func alterarZoom(escala: CGFloat) {
        do {
            try camera?.lockForConfiguration()
            camera?.videoZoomFactor = escala
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

//
//struct ModoCameraView: View {
//    let larguraTela = UIScreen.main.bounds.size.width
////   VARIAVEIS QUE ACABEU DE CRIAR PARA A CAMERA, UMA DE ZOOM E A OUTRA PARA ACESSAR A CAMERA
//    let cameraDevice = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back)
//    @State private var zoomScale: CGFloat = 1.0
//
//    @StateObject var cameraViewModel = ModoCameraViewModel()
//
//    var body: some View {
//        ZStack{
//        VStack{
//            ModoCameraModel(cameraViewModel: cameraViewModel)
//                .ignoresSafeArea(.all, edges: .all)
//
//                Rectangle()
//                    .foregroundColor(.white)
//                    .frame(width: larguraTela, height: 300, alignment: .center)
//                    .opacity(0.5)
//
//                Circle()
//                    .scale(0.5)
//                    .stroke(.black, lineWidth: 3)
//                    .opacity(0.5)
////            Rectangle()
////                .foregroundColor(.white)
////                .frame(width: larguraTela, height: 300, alignment: .center)
////                .opacity(0.5)
////
////            Circle()
////                .scale(0.5)
////                .stroke(.black, lineWidth: 3)
////                .opacity(0.5)
//
//            Image(systemName: "plus.magnifyingglass")
//                .font(.title)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.black.opacity(0.5))
//                .cornerRadius(10)
////            TAP GESTURE DO ZOOM QUE ACABEI DE CRIAR
//                .onTapGesture {
//                    zoomScale += 0.1
//                                                            updateZoom()
//                }
//            Image(systemName: "minus.magnifyingglass")
//                .font(.title)
//                .foregroundColor(.white)
//                .padding()
//                .background(Color.black.opacity(0.5))
//                .cornerRadius(10)
//            //            TAP GESTURE DO ZOOM QUE ACABEI DE CRIAR
//                .onTapGesture {
//                    zoomScale -= 0.1
//                                                            updateZoom()
//                }
//                .onAppear(perform: cameraViewModel.checarPermissao)
//            //        .alert(isPresented: $cameraViewModel.alerta){
//            //            Alert(title: Text("Please enable cameraModel access"))
//            //        }
//        }
//
//    }
//
////    FUNCAO DO ZOOM QUE ACABEI DE CRIAR
//    func updateZoom() {
//        do {
//            try cameraDevice?.lockForConfiguration()
//            cameraDevice?.videoZoomFactor = zoomScale
//            cameraDevice?.unlockForConfiguration()
//        } catch {
//            print("Failed to update zoom: \(error.localizedDescription)")
//        }
//        .onAppear(perform: cameraViewModel.checarPermissao)
////        .alert(isPresented: $cameraViewModel.alerta){
////            Alert(title: Text("Please enable cameraModel access"))
////        }
//    }
//}

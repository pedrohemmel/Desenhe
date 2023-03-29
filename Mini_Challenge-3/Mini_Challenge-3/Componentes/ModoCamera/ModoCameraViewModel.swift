//
//  ModoCameraViewModel.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import AVFoundation

class ModoCameraViewModel: ObservableObject {
    @Published var sessao = AVCaptureSession()
    @Published var alerta = false
    @Published var saida = AVCaptureMovieFileOutput()
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    func checarPermissao() {
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .authorized:
            self.configurar()
            return
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.configurar()
                }
            }
            
        case .denied:
            self.alerta.toggle()
            return
            
        default:
            return
        }
    }
    
    func configurar(){
        do{
            self.sessao.beginConfiguration()
            let cameraDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            let input = try AVCaptureDeviceInput(device: cameraDevice!)
            
            if self.sessao.canAddInput(input){
                self.sessao.addInput(input)
            }
            
            if self.sessao.canAddOutput(self.saida){
                self.sessao.addOutput(self.saida)
            }
            
            self.sessao.commitConfiguration()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

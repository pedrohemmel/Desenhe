//
//  ModoCameraModel.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI
import AVFoundation

struct ModoCameraRepresentable: UIViewRepresentable {
    @ObservedObject var cameraViewModel: ModoCameraViewModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
            cameraViewModel.preview = AVCaptureVideoPreviewLayer(session: cameraViewModel.sessao)
            cameraViewModel.preview.frame = view.frame
            cameraViewModel.preview.videoGravity = .resizeAspectFill
            view.layer.addSublayer(cameraViewModel.preview)
            
            DispatchQueue.global(qos: .userInitiated).async {
                cameraViewModel.sessao.startRunning()
            }
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}


//
//  TelaDesenharViewModel.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 28/03/23.
//

import Foundation
import AVFoundation

class TelaDesenharViewModel {
    let camera = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back)
    
    func alterarZoom(escala: CGFloat) {
        let novaEscala = 1 + 6 * (1 - escala)
        do {
            try camera?.lockForConfiguration()
            camera?.videoZoomFactor = novaEscala
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

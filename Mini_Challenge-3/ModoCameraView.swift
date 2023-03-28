//
//  ModoCameraView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 23/03/23.
//

import SwiftUI
import AVFoundation

struct ModoCameraView: View {
    let larguraTela = UIScreen.main.bounds.size.width
    
    @StateObject var cameraViewModel = ModoCameraViewModel()
    
    var body: some View {
        ZStack{
            ModoCameraModel(cameraViewModel: cameraViewModel)
                .ignoresSafeArea(.all, edges: .all)
            
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: larguraTela, height: 300, alignment: .center)
                    .opacity(0.5)
                
                Circle()
                    .scale(0.5)
                    .stroke(.black, lineWidth: 3)
                    .opacity(0.5)
        }
        .onAppear(perform: cameraViewModel.checarPermissao)
//        .alert(isPresented: $cameraViewModel.alerta){
//            Alert(title: Text("Please enable cameraModel access"))
//        }
    }
}

struct ModoCameraView_Previews: PreviewProvider {
    static var previews: some View {
        ModoCameraView()
    }
}

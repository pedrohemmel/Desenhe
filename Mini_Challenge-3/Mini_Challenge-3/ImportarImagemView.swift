//
//  ImportarImagemView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
import PhotosUI
@available(iOS 16.0, *)
struct ImportarImagemView: View {
    @State private var itemSelecionado: PhotosPickerItem? = nil
    @State private var dadosImagemSelecionada: Data? = nil
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        PhotosPicker(
            selection: $itemSelecionado,
            matching: .images,
            photoLibrary: .shared()) {
                Text("Selecione a imagem")
            }
            .onChange(of: itemSelecionado) { newItem in
                Task {
                    // Retrieve selected asset in the form of Data
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        dadosImagemSelecionada = data
                    }
                }
            }
        
        if let dadosImagemSelecionada,
           let uiImage = UIImage(data: dadosImagemSelecionada) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth, height: 250)
        }
    }
}

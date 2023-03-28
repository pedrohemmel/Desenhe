//
//  ImportarImagemView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
import PhotosUI
struct BotaoImportarImagemComponente: View {
    @Binding var imagemEstaSelecionada: Bool
    @State private var imagemSelecionada: PhotosPickerItem? = nil
    @Binding var dadosImagemSelecionada: Data
    
    var body: some View {
        PhotosPicker(selection: $imagemSelecionada, matching: .images, photoLibrary: .shared()) {
            Text("Selecione a imagem")
                .padding(.vertical, 20)
                .padding(.horizontal, 60)
                .background(Color.black)
                .cornerRadius(20)
        }
        .onChange(of: imagemSelecionada) { novaImagemSelecionada in
            Task {
                if let data = try? await novaImagemSelecionada?.loadTransferable(type: Data.self) {
                    dadosImagemSelecionada = data
                    self.imagemEstaSelecionada = true
                }
            }
        }
    }
}

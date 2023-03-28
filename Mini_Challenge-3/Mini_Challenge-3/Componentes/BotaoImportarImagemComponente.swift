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
    @Binding var dadosImagemSelecionada: Data
    @State private var imagemSelecionada: PhotosPickerItem? = nil
    
    let larguraTela = UIScreen.main.bounds.size.width
    
    var body: some View {
        PhotosPicker(selection: $imagemSelecionada, matching: .images, photoLibrary: .shared()) {
            HStack {
                Image(systemName: "square.and.arrow.down")
                    .font(.system(size: 25))
                Text("   Importe uma foto de sua galeria")
                    .font(.system(size: 14))
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .frame(minWidth: larguraTela*0.75, alignment: .leading)
            .background(Color("corBotao"))
            .cornerRadius(10)
            .foregroundColor(.black)
            
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

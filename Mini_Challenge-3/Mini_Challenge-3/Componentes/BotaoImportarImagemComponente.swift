//
//  ImportarImagemView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
import PhotosUI
struct BotaoImportarImagemComponente: View {
    @Binding var paginaConfirmarDesenho: Bool
    @Binding var paginaNossosDesenhos: Bool
    @Binding var paginaTelaDesenhar: Bool
    @Binding var imagemEstaSelecionada: Bool
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    @Binding var referenciaDesenhoSelecionado: String
    @State private var imagemSelecionada: PhotosPickerItem? = nil
    
    @State var acionouNavigation = false
    
    let larguraTela = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: ControladorTelas(
                    paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                    paginaNossosDesenhos: self.$paginaNossosDesenhos,
                    paginaTelaDesenhar: self.$paginaTelaDesenhar,
                    imagemEstaSelecionada: self.$imagemEstaSelecionada,
                    dadosImagemSelecionada: self.$dadosImagemSelecionada,
                    desenhoSelecionado: self.$desenhoSelecionado,
                    referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                    voltaParaTelaInicial: .constant(false),
                    eMeSurpreenda: false),
                isActive: self.$acionouNavigation,
                label: {})
            PhotosPicker(selection: $imagemSelecionada, matching: .images, photoLibrary: .shared()) {
                HStack {
                    Image(systemName: "square.and.arrow.down")
                        .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 25 : 50))
                    
                    Text("   Importe uma foto de sua galeria")
                        .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 14 : 28))
                }
                .foregroundColor(Color("texts"))
                .frame(minWidth: UIDevice.current.userInterfaceIdiom == .phone ? larguraTela*0.75 : larguraTela*0.60, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
                .background(Color("corBotao"))
                .cornerRadius(10)
                .foregroundColor(.black)
                
            }
        }
        .onChange(of: imagemSelecionada) { novaImagemSelecionada in
            Task {
                if let data = try? await novaImagemSelecionada?.loadTransferable(type: Data.self) {
                    dadosImagemSelecionada = data
                    
                    self.paginaTelaDesenhar = false
                    self.paginaNossosDesenhos = false
                    self.paginaConfirmarDesenho = true
                    self.acionouNavigation = true
                }
            }
        }
    }
}

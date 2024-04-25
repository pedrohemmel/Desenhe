//
//  BotaoTesteGeralComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct BotaoMenuInicialComponente: View {
    @Binding var paginaNossosDesenhos: Bool
    @Binding var paginaConfirmarDesenhos: Bool
    var paginaEscolhida: String
    var destination: AnyView
    var image: Image
    var text: String
    
    @State var acionouBotao = false
    
    let larguraTela = UIScreen.main.bounds.size.width
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: destination,
                isActive: self.$acionouBotao,
                label: {})
            Button {
                if self.paginaEscolhida == "PND" {
                    self.paginaConfirmarDesenhos = false
                    self.paginaConfirmarDesenhos = false
                    self.paginaNossosDesenhos = true
                } else if self.paginaEscolhida == "PCD" {
                    self.paginaConfirmarDesenhos = false
                    self.paginaConfirmarDesenhos = true
                    self.paginaNossosDesenhos = false
                }
                self.acionouBotao.toggle()
            } label: {
                HStack {
                    image
                        .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 25 : 50))
                    Text("\(text)")
                        .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 14 : 28))
                }
                .frame(minWidth: UIDevice.current.userInterfaceIdiom == .phone ? larguraTela*0.75 : larguraTela*0.60, alignment: .leading)
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
            }
            .background(Color("corBotao"))
            .cornerRadius(10)
            .foregroundColor(Color("texts"))
            
        }
        
    }
    
}

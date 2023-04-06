//
//  BotaoTesteGeralComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct BotaoMenuInicialComponente: View {
    let larguraTela = UIScreen.main.bounds.size.width
    var destination: AnyView
    var image: Image
    var text: String
    
    init(destination: AnyView, imageName: String,text: String) {
        self.destination = destination
        self.image = Image(systemName: imageName)
        self.text = text
    }
    
    var body: some View {
        NavigationLink(destination: destination, label: {
            HStack {
                image
                    .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 25 : 50))
                Text("\(text)")
                    .font(.system(size: UIDevice.current.userInterfaceIdiom == .phone ? 14 : 28))
            }
            .frame(minWidth: UIDevice.current.userInterfaceIdiom == .phone ? larguraTela*0.75 : larguraTela*0.60, alignment: .leading)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
        })
        .background(Color("corBotao"))
        .cornerRadius(10)
        .foregroundColor(Color("texts"))
    }
    
}

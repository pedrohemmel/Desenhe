//
//  ConfirmarDesenhoView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 24/03/23.
//

import SwiftUI

struct ConfirmarDesenhoView: View {
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("post1")
                    .resizable()
                    .frame(width: larguraTela, height: larguraTela)
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Desenhar \(Image(systemName: "arrow.right"))")
                        .padding(15)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 40)
                        .padding(.trailing, 10)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    print("Sair")
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

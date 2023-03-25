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
        
        ZStack{
            Color.black
                .ignoresSafeArea()
            
            Group{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: larguraTela, height: 300)
                    .opacity(0.5)
                
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: 200)
                    .opacity(0.5)
            }
            .padding(.init(top: -100, leading: 0, bottom: 0, trailing: 0))
            
            VStack {
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding(.init(top: 20, leading: -170, bottom: 0, trailing: 0))
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Desenhar \(Image(systemName: "arrow.right"))")
                        .padding(15)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.init(top: 0, leading: 0, bottom: 70, trailing: 25))
                }
            }
        }
    }
}

struct ConfirmarDesenhoView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmarDesenhoView()
    }
}

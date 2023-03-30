//
//  SplashScreen.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 30/03/23.
//

import SwiftUI

struct TelaDSplash: View {
    @State var telaDSplashAtiva = true
    @State var opacidade = 0.0
    
    let larguraTela = UIScreen.main.bounds.width
    let alturaTela = UIScreen.main.bounds.height
    var body: some View {
        VStack {
            if !telaDSplashAtiva {
                TelaInicialView()
            } else {
                Image("TelaDSplash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.larguraTela, height: self.alturaTela)
                    .opacity(opacidade)
            }
        }
        .onAppear {
            withAnimation {
                self.opacidade = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.telaDSplashAtiva = false
                }
            }
        }
        
    }
}

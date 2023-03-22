//
//  TesteTelaInicialView.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct TelaInicialView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Titulo")
                    .padding(.top, 60)
                Spacer()
                BotaoGeral(destination: AnyView(TelaInicialView()), text: "Primeiro botão")
                    .padding(.bottom, 40)
                BotaoGeral(destination: AnyView(TelaInicialView()), text: "Primeiro botão")
                    .padding(.bottom, 40)
                BotaoGeral(destination: AnyView(TelaInicialView()), text: "Primeiro botão")
                Spacer()
                Spacer()
            }
        }
        
    }
}

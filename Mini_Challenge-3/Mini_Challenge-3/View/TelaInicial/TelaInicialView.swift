//
//  TesteTelaInicialView.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct TelaInicialView: View {
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("Vamos Desenhar!")
                        .padding(.bottom, 5)
                    Text("Para começar...")
                }
                .padding(.bottom, 50)
                
                BotaoMenuInicialComponente(destination: AnyView(TelaInicialView()), imageName: "square.and.arrow.down", text: "   Importe uma foto de sua galeria")
                    .padding(.bottom, 15)
                
                BotaoMenuInicialComponente(destination: AnyView(NossosDesenhosView()), imageName: "rectangle.3.offgrid.fill", text: "Escolha um de nossos desenhos")
                    .padding(.bottom, 15)
                
                BotaoMenuInicialComponente(destination: AnyView(TelaInicialView()), imageName: "lightbulb", text: "     Me surpreenda")
            }
        }
        .position(CGPoint(x: larguraTela*0.5, y: alturaTela*0.4))
    }
}

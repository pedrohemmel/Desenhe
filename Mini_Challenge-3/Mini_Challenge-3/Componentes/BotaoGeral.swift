//
//  BotaoGeral.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import Foundation
import SwiftUI

public class BotaoGeral {
    
    func criarNavigationLink(nomeBotao: String, destino: String) -> some View {
        let navigationLink = NavigationLink {
            
            switch destino {
            case "Botao Importar" :
                TesteView()
            case "desenhos":
                Text("oi")
            default:
                TelaInicialView()
            }
            
        }
        label: {
            Text(nomeBotao)
        }
        return navigationLink
    }
}

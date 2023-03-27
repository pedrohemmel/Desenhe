//
//  BotaoTesteGeralComponente.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 21/03/23.
//

import SwiftUI

struct BotaoMenuInicialComponente: View {
    var destination: AnyView
    var text: String
    
    init(destination: AnyView, text: String) {
        self.destination = destination
        self.text = text
    }
    
    var body: some View {
        HStack {
            NavigationLink(destination: destination, label: {
                Text("\(text)")
            })
            .padding(.vertical, 20)
            .padding(.horizontal, 60)
            .background(Color.black)
            .cornerRadius(20)        }
    }
}

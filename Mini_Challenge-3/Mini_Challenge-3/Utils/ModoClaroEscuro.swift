//
//  ModoClaroEscuro.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 30/03/23.
//

import SwiftUI

struct ModoClaroEscuro: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image
    
    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

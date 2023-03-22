//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "search")
                TextField("Pesquise aqui", text: $searchText)
            }
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
            Spacer()
        }
        .navigationBarTitle(Text("Nossos Desenhos"), displayMode: .inline)
    }
}

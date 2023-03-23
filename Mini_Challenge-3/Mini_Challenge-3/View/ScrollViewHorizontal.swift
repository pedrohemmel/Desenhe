//
//  ScrollViewHorizontal.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 23/03/23.
//

import SwiftUI

struct ScrollViewHorizontal: View {
    @State var array = ["Pedro", "Rodrigao", "Cecilia", "Pintudinho", "Cec", "Sarah", "Danilo Santana"]
    let larguraTela = UIScreen.main.bounds.size.width
    private let tamanhoImagem = 150.0
//    var 
    
    var body: some View {
        VStack {
            HStack {
                Text("Titulo")
                    .padding(10)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
                Spacer()
            }
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(0))], content: {
                    ForEach(array, id: \.self) {nome in
                        Button {
                            print(nome)
                        } label: {
                            Image("post1")
                                .frame(width: self.tamanhoImagem, height: self.tamanhoImagem)
                                
                        }
                    }
                })
            }
            .frame(height: self.tamanhoImagem)
            .padding(.horizontal, 10)
        }
        
    }
}

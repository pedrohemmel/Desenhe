//
//  ContentView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 20/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var carregadorInfDesenho: CarregadorInfDesenho?
    @State var recebeuInfDesenho = false
    var body: some View {
        VStack {
            if recebeuInfDesenho {
                ForEach(carregadorInfDesenho?.infDesenho?.categorias ?? [Categoria](), id: \.id) { categoria in
                    VStack {
                        Text("\(categoria.nomeCategoria)")
                        ForEach(categoria.desenhos, id: \.id) { desenho in
                            Text("\(desenho.nomeDiretorio)")
                                .padding(.leading, 50)
                        }
                    }
                    .padding(.bottom, 50)
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            self.carregadorInfDesenho = coletaDados {
                self.recebeuInfDesenho = true
            }
        }
        .padding()
    }
    
    func coletaDados(resposta: @escaping (() -> Void)) -> CarregadorInfDesenho {
        let carregador = CarregadorInfDesenho(resposta: resposta)
        
        return carregador
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

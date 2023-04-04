//
//  DesenhosDePesquisaComponente.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 30/03/23.
//

import SwiftUI

struct DesenhosDePesquisaComponente: View {
    @Binding var textoPesquisa: String
    @Binding var desenhoSelecionado: String
    @Binding var imagemEstaSelecionada: Bool
    @Binding var categorias: [Categoria]
    
    @State var desenhosPesquisados = [Desenho]()
    
    let larguraTela = UIScreen.main.bounds.size.width
    let colunas = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            if desenhosPesquisados.isEmpty {
                Text("Título não encontrado")
                    .padding(.top, 40)
            } else {
                LazyVGrid(columns: colunas, spacing: 10) {
                    ForEach(desenhosPesquisados, id: \.id) { desenho in
                        Button(action: {
                            self.desenhoSelecionado = "\(desenho.nomeDiretorio)"
                            self.imagemEstaSelecionada = true
                        }, label: {
                            Image("\(desenho.nomeDiretorioMiniatura)")
                                .resizable()
                                .frame(width: self.larguraTela * 0.2, height: self.larguraTela * 0.2)
                                .cornerRadius(10)
                        })
                    }
                }
            }
            Spacer()
        }
        .onChange(of: textoPesquisa) { novaPesquisa in
            self.desenhosPesquisados = buscaDesenhosPesquisados(categorias: self.categorias, textoPesquisado: novaPesquisa)
        }
    }
    
    func buscaDesenhosPesquisados(categorias: [Categoria], textoPesquisado: String) -> [Desenho] {
        var desenhos = [Desenho]()
        for categoria in categorias {
            for desenho in categoria.desenhos {
                for palavraChave in desenho.palavrasChaves {
                    if palavraChave.lowercased().contains(textoPesquisado.lowercased()) {
                        desenhos.append(desenho)
                        break
                    }
                }
            }
        }
        print(desenhos)
        return desenhos
    }
    
}

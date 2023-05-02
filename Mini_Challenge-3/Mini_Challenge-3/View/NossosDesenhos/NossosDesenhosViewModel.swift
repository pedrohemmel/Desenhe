//
//  NossosDesenhosViewModel.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import Foundation
import SwiftUI

class NossosDesenhosViewModel {
    var carregadorInfDesenho: CarregadorInfDesenho? = nil
    
    func buscarInfDesenho(resposta: @escaping (() -> Void)) {
        self.carregadorInfDesenho = CarregadorInfDesenho(resposta: resposta)
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
        return desenhos
    }
    
    func verificaTextoDePalavrasChaves(desenho: Desenho, textoPesquisa: String) -> Bool {
        for palavraChave in desenho.palavrasChaves {
            if palavraChave.contains(textoPesquisa) {
                return true
            }
        }
        
        return false
    }
    
    func esconderTeclado() {
        let resposta = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resposta, to: nil, from: nil, for: nil)
    }
}

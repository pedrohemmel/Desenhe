//
//  ConfirmarDesenhoViewModel.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 27/03/23.
//

import Foundation

class ConfirmarDesenhoViewModel {
    var carregadorInfDesenho: CarregadorInfDesenho? = nil
    func buscarInfDesenho(resposta: @escaping (() -> Void)) {
        self.carregadorInfDesenho = CarregadorInfDesenho(resposta: resposta)
    }
    
    //retorna nome do diretório do desenho e referencia do desenho
    func sortearDesenho() -> (String, String) {
        var desenhos = [Desenho]()
        for categoria in self.carregadorInfDesenho?.infDesenho?.categorias ?? [Categoria]() {
            for desenho in categoria.desenhos {
                desenhos.append(desenho)
            }
        }
        
        let imagemSorteada = desenhos[Int.random(in: 0...(desenhos.count - 1))]
        return (imagemSorteada.nomeDiretorio, imagemSorteada.referenciaImagem)
    }
}


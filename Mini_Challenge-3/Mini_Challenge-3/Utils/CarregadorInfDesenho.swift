//
//  CarregadorDesenhos.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 21/03/23.
//

import Foundation

class CarregadorInfDesenho {
    private(set) var infDesenho: InfDesenho?
    var resposta: (() -> Void)
    
    init(resposta: @escaping (() -> Void)) {
        self.resposta = resposta
        self.carregarInfDesenho()
    }
    
    func carregarInfDesenho() {
        if let arquivoJSON = Bundle.main.path(forResource: "InfDesenhoJSON", ofType: "json") {
            do {
                guard let dados = try String(contentsOfFile: arquivoJSON).data(using: .utf8) else { return }
                let jsonDecoder = JSONDecoder()
                let dadosFormatados = try jsonDecoder.decode(InfDesenho.self, from: dados)
                print(dadosFormatados)
                
                DispatchQueue.main.async {
                    self.infDesenho = dadosFormatados
                    self.resposta()
                }
            } catch {
                print("Erro: Não foi possível decodar arquivo json.")
            }
            return
        }
        
        print("Erro: Não foi possível localizar o arquivo.")
    }
}

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
}

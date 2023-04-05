//
//  Categoria.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 21/03/23.
//

import Foundation

struct Categoria: Codable {
    let id: Int
    let nomeCategoria: String
    let desenhos: [Desenho]
}


//
//  ControladorTelas.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 24/04/23.
//

import SwiftUI

struct ControladorTelas: View {
    //MARK: - Variáveis locais
    @Binding var paginaConfirmarDesenho: Bool
    @Binding var paginaNossosDesenhos: Bool
    @Binding var paginaTelaDesenhar: Bool
    
    //MARK: - Variáveis necessárias nas páginas a seguir do app
    @Binding var imagemEstaSelecionada: Bool
    @Binding var dadosImagemSelecionada: Data
    @Binding var desenhoSelecionado: String
    @Binding var referenciaDesenhoSelecionado: String
    
    var eMeSurpreenda: Bool
    
    
    var body: some View {
        ZStack {
            if self.paginaConfirmarDesenho {
                ConfirmarDesenhoView(
                    paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                    paginaNossosDesenhos: self.$paginaNossosDesenhos,
                    paginaTelaDesenhar: self.$paginaTelaDesenhar,
                    dismissDasTelas: .constant({print("voltar")}),
                    dadosImagemSelecionada: self.$dadosImagemSelecionada,
                    desenhoSelecionado: self.$desenhoSelecionado,
                    imagemEstaSelecionada: self.$imagemEstaSelecionada, referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                    eMeSurpreenda: self.eMeSurpreenda)
            } else if self.paginaNossosDesenhos {
                NossosDesenhosView(
                    paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                    paginaNossosDesenhos: self.$paginaNossosDesenhos,
                    paginaTelaDesenhar: self.$paginaTelaDesenhar,
                    imagemEstaSelecionada: self.$imagemEstaSelecionada,
                    desenhoSelecionado: self.$desenhoSelecionado,
                    referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado)
            } else if self.paginaTelaDesenhar {
                TelaDesenharView(
                    paginaConfirmarDesenho: self.$paginaConfirmarDesenho,
                    paginaNossosDesenhos: self.$paginaNossosDesenhos,
                    paginaTelaDesenhar: self.$paginaTelaDesenhar,
                    dadosImagemSelecionada: self.$dadosImagemSelecionada,
                    desenhoSelecionado: self.$desenhoSelecionado,
                    imagemEstaSelecionada: self.$imagemEstaSelecionada,
                    referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado)
            }
        }
    }
}


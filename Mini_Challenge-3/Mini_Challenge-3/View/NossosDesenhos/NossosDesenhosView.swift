//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @Environment(\.dismiss) var dismiss
    @State var imagemEstaSelecionada = false
    @State var desenhoSelecionado = ""
    
    @State private var textoPesquisa = ""
    @State var filtroSelecionado = ""
    @State var filtroAberto = false
    
    @State var infDesenho: InfDesenho? = nil
    @State var categorias = [Categoria]()
    @State var recebeuInfDesenho = false
    @State var voltaParaTelaInicial = false
    var nossosDesenhosViewModel = NossosDesenhosViewModel()
    
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    private enum Field: Int {
        case searchBar
    }

    @FocusState private var focusedField: Field?
    
    @State var textFieldEstaEditando = false
    
    var body: some View {
        ZStack {
            ModoClaroEscuro(light: Image("fundoLight"), dark: Image("fundoDark"))
                .ignoresSafeArea()
            if recebeuInfDesenho {
                NavigationLink(
                    destination: ConfirmarDesenhoView(
                        dismissDasTelas: .constant {
                            self.dismiss()
                        },
                        dadosImagemSelecionada: .constant(Data()),
                        desenhoSelecionado: $desenhoSelecionado,
                        voltaParaTelaInicial: self.$voltaParaTelaInicial),
                    isActive: self.$imagemEstaSelecionada, label: {})
                
                VStack {
                    if UIDevice.current.userInterfaceIdiom == .phone{
                        if focusedField != nil && !self.textFieldEstaEditando {
                            withAnimation() {
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(maxWidth: .infinity, maxHeight: 140)
                            }
                            
                        }
                    }
                    
                    SearchBarComponente(
                        textoPesquisa: self.$textoPesquisa,
                        filtroAberto: self.$filtroAberto,
                        filtroSelecionado: self.$filtroSelecionado,
                        textFieldEstaEditando: self.$textFieldEstaEditando)
                    .padding(.top, 65)
                    .focused($focusedField, equals: .searchBar)
                    if textoPesquisa == "" {
                        if filtroSelecionado == "" {
                            ScrollView {
                                ForEach(self.categorias, id: \.id) { categoria in
                                    CarrosselComponente(
                                        imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                        desenhoSelecionado: self.$desenhoSelecionado,
                                        categoriaDesenhos: .constant(categoria.nomeCategoria),
                                        desenhos: .constant(categoria.desenhos))
                                        .padding(.top, 5)
                                }
                            }
                            .padding(.bottom, 40)
                        } else {
                            CategoriaEscolhidaComponente(
                                imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                desenhoSelecionado: self.$desenhoSelecionado,
                                filtroSelecionado: self.$filtroSelecionado,
                                categorias: .constant(self.categorias))
                        }
                    } else if textoPesquisa != "" && self.filtroSelecionado == "" {
                        DesenhosDePesquisaComponente(
                            textoPesquisa: self.$textoPesquisa,
                            desenhoSelecionado: self.$desenhoSelecionado,
                            imagemEstaSelecionada: self.$imagemEstaSelecionada,
                            categorias: self.$categorias)
                    } else {
                        
                    }
                    
                }
                if self.filtroAberto {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .opacity(0.000000001)
                        .onTapGesture {
                            self.filtroAberto = false
                        }
                }
                FiltroNossosDesenhosComponente(categorias: $categorias, filtroAberto: self.$filtroAberto, filtroSelecionado: self.$filtroSelecionado)
                    .padding(.top, 65)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("texts")))
            }
            
        }
        .animation({
            if self.voltaParaTelaInicial == true {
                return .none
            } else {
                return .default
            }
        }())
        .ignoresSafeArea(.keyboard)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("Nossos Desenhos")
                        .foregroundColor(.accentColor)
                }
            }
        }
        .onAppear {
            if self.verificaVoltaParaTelaInicial() {
                self.dismiss()
            }
            self.nossosDesenhosViewModel.buscarInfDesenho {
                self.recebeuInfDesenho = true
                self.infDesenho = self.nossosDesenhosViewModel.carregadorInfDesenho?.infDesenho
                self.categorias = self.infDesenho!.categorias
            }
            
        }
    }
    
    func verificaVoltaParaTelaInicial() -> Bool {
        return self.voltaParaTelaInicial
    }
}

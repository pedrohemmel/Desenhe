//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @State var imagemEstaSelecionada = false
    @State var desenhoSelecionado = ""
    
    @State private var textoPesquisa = ""
    @State var filtroSelecionado = ""
    @State var filtroAberto = false
    
    @State var infDesenho: InfDesenho? = nil
    @State var categorias = [Categoria]()
    @State var recebeuInfDesenho = false
    var nossosDesenhosViewModel = NossosDesenhosViewModel()
    
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    private enum Field: Int {
        case searchBar
    }
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            ModoClaroEscuro(light: Image("fundoLight"), dark: Image("fundoDark"))
                .ignoresSafeArea()
            

            if recebeuInfDesenho {
                NavigationLink(destination: ConfirmarDesenhoView(dadosImagemSelecionada: .constant(Data()), desenhoSelecionado: $desenhoSelecionado), isActive: self.$imagemEstaSelecionada, label: {})
                
                VStack {
                    if focusedField != nil{
                        withAnimation() {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(maxWidth: .infinity, maxHeight: 150)
                        }
                        
                    }
                    
                    SearchBarComponente(
                        textoPesquisa: self.$textoPesquisa,
                        filtroAberto: self.$filtroAberto,
                        filtroSelecionado: self.$filtroSelecionado)
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
                FiltroNossosDesenhosComponente(categorias: $categorias, filtroAberto: self.$filtroAberto, filtroSelecionado: self.$filtroSelecionado)
                    .padding(.top, 65)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("texts")))
            }
            
        }
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
            self.nossosDesenhosViewModel.buscarInfDesenho {
                self.recebeuInfDesenho = true
                self.infDesenho = self.nossosDesenhosViewModel.carregadorInfDesenho?.infDesenho
                self.categorias = self.infDesenho!.categorias
            }
        }
    }
}

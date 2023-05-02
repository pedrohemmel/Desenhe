//
//  NossosDesenhosView.swift
//  Mini_Challenge-3
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 22/03/23.
//

import SwiftUI
struct NossosDesenhosView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var paginaConfirmarDesenho: Bool
    @Binding var paginaNossosDesenhos: Bool
    @Binding var paginaTelaDesenhar: Bool
    
    @Binding var imagemEstaSelecionada: Bool
    @Binding var desenhoSelecionado: String
    @Binding var referenciaDesenhoSelecionado: String
    
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
            if recebeuInfDesenho {
                VStack {                    
                    SearchBarComponente(
                        textoPesquisa: self.$textoPesquisa,
                        filtroAberto: self.$filtroAberto,
                        filtroSelecionado: self.$filtroSelecionado,
                        textFieldEstaEditando: self.$textFieldEstaEditando)
                    .padding(.top, 20)
                    .focused($focusedField, equals: .searchBar)
                    if textoPesquisa == "" {
                        if filtroSelecionado == "" {
                            ScrollView {
                                ForEach(self.categorias, id: \.id) { categoria in
                                    CarrosselComponente(
                                        imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                        desenhoSelecionado: self.$desenhoSelecionado,
                                        referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                                        categoriaDesenhos: .constant(categoria.nomeCategoria),
                                        desenhos: .constant(categoria.desenhos),
                                        nossosDesenhosViewModel: self.nossosDesenhosViewModel)
                                        .padding(.top, 5)
                                }
                            }
                            .padding(.bottom, 40)
                        } else {
                            CategoriaEscolhidaComponente(
                                imagemEstaSelecionada: self.$imagemEstaSelecionada,
                                desenhoSelecionado: self.$desenhoSelecionado,
                                referenciaDesenhoSelecionado: self.$referenciaDesenhoSelecionado,
                                filtroSelecionado: self.$filtroSelecionado,
                                categorias: .constant(self.categorias),
                                nossosDesenhosViewModel: self.nossosDesenhosViewModel)
                        }
                    } else if textoPesquisa != "" && self.filtroSelecionado == "" {
                        DesenhosDePesquisaComponente(
                            textoPesquisa: self.$textoPesquisa,
                            desenhoSelecionado: self.$desenhoSelecionado,
                            imagemEstaSelecionada: self.$imagemEstaSelecionada,
                            categorias: self.$categorias,
                            nossosDesenhosViewModel: self.nossosDesenhosViewModel)
                    } else {
                        
                    }
                    
                }
                if self.filtroAberto {
                    Rectangle()
                        ////height esta - 150 pois o tamanho completo estava bugando a tela
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150)
                        .opacity(0.000000001)
                        .onTapGesture {
                            self.filtroAberto = false
                            self.textFieldEstaEditando = false
                        }
                }
                FiltroNossosDesenhosComponente(
                    categorias: $categorias,
                    filtroAberto: self.$filtroAberto,
                    filtroSelecionado: self.$filtroSelecionado,
                    textFieldEstaEditando: self.$textFieldEstaEditando)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("texts")))
            }
            
        }
        .onChange(of: self.imagemEstaSelecionada) { iES in
            if iES {
                self.paginaTelaDesenhar = false
                self.paginaNossosDesenhos = false
                self.paginaConfirmarDesenho = true
            }
        }
        .onChange(of: self.textoPesquisa) { novaPesquisa in
            self.filtroSelecionado = ""
        }
        .onTapGesture {
            self.nossosDesenhosViewModel.esconderTeclado()
        }
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
                self.categorias = self.infDesenho!.categorias.sorted(by: { $0.nomeCategoria < $1.nomeCategoria })
            }
            
        }
        .background(Image("fundo").position(x: larguraTela*0.5, y: alturaTela*0.39))
        .ignoresSafeArea(.keyboard)
    }

}

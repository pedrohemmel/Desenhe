//
//  MesaDeLuzView.swift
//  Mini_Challenge-3
//
//  Created by Rodrigo Ferreira Pereira on 27/03/23.
//

import SwiftUI

struct MesaDeLuzView: View {
    let larguraTela = UIScreen.main.bounds.size.width
    let alturaTela = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "lock.circle.fill")
                    .foregroundColor(.black)
                    .font(.system(size: 30))
                
                Spacer()
                
                Text("Mesa de Luz")
                    .bold()
                
                Spacer()
                
                Text("Concluir")
            }
            .padding(10)
                        
            Spacer()
            
            ZStack{
                Rectangle()
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .frame(width: larguraTela, height: 300)
                
                Circle()
                    .stroke(lineWidth: 3)
                    .frame(width: 200)
                    .opacity(0.5)
            }
            .position(.init(x: larguraTela*0.5, y: alturaTela*0.4))
        }
    }
}

struct MesaDeLuzView_Previews: PreviewProvider {
    static var previews: some View {
        MesaDeLuzView()
    }
}

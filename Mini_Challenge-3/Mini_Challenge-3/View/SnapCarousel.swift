//
//  ScrollHorizontal.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 22/03/23.
//

import SwiftUI

struct SnapCarousel<Content: View,T: Identifiable>: View{
    var content: (T) -> Content
    var list: [T]
    
    //    Propriedades
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index: Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>,items: [T],@ViewBuilder content: @escaping (T)->Content) {
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
        
        
    }
    
    //Offset
    @GestureState var offset: CGFloat = 0
    @State var currentIndex: Int = 0
    
    var body: some View {
        
        GeometryReader{proxy in
            
            // Setting correct width for snap carousel...
            
            // One sided snap carousel...
            
            let width = proxy.size.width - (trailingSpace - spacing)
            let adjustMentWidth = (trailingSpace / 2) - spacing
            
            HStack(spacing: spacing){
             
                ForEach(list){item in
                    
                    content(item)
                    //Espaco para uma foto e outra
                        .frame(width: proxy.size.width - trailingSpace)
                }
            }
            //spacing will be horizontal padding...
            .padding(.horizontal, spacing)
            // setting only after 0th index..
            .offset(x: (CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset)
            .gesture(
                
                DragGesture()
                    .updating($offset, body: { value, out, _ in
                        
                        out = value.translation.width
                    })
                    .onEnded({ value in
                              
                        //updating Current index
                        let offsetX = value.translation.width
                        
                        //were going to convert the translation into progress (0 - 1)
                        //and round the value...
                        //based on the progres increasing or decreasing the currentIndex...
                        
                        //Andamento das imagens
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        //setting min
                        currentIndex += max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                        //update index...
                        currentIndex = index
                    })
                    .onChanged({ value in
                        // updating only index...
                        
                        //updating Current index
                        let offsetX = value.translation.width
                        
                        //were going to convert the translation into progress (0 - 1)
                        //and round the value...
                        //based on the progres increasing or decreasing the currentIndex...
                        
                        //Andamento das imagens
                        let progress = -offsetX / width
                        
                        let roundIndex = progress.rounded()
                        
                        //setting min
                        index += max(min(currentIndex + Int(roundIndex), list.count - 1), 0)
                        
                    })
            )
        }
        // Animating when offset = 0
        .animation(.easeInOut, value: offset == 0)
    }
}

struct ScrollHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

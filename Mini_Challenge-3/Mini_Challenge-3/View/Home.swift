//
//  Home.swift
//  Mini_Challenge-3
//
//  Created by Guilherme Borges on 22/03/23.
//

import SwiftUI

struct Home: View {
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    var body: some View {
        
        VStack(spacing: 15){
            
            VStack(alignment: .leading, spacing: 100) {
                
                Text("Meu carrossel")
                    .font(.title)
                    .fontWeight(.black)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            
            //Carousel
            //espaco entre as imagens
            SnapCarousel(spacing: 25,index: $currentIndex, items: posts) {post in
                
                GeometryReader{ proxy in
                    
                    let size = proxy.size
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                    
                    
                }
                
            }
            // Spacing will be horizontal padiding
            .padding(.vertical, 40)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear{
            for index in 1...5{
                posts.append(Post(postImage: "post\(index)"))
            }
        }
    }
    
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            Home()
        }
    }
}

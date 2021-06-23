//
//  CarouselBodyView.swift
//  CarouselSlider
//
//  Created by 山本響 on 2021/06/23.
//

import SwiftUI

struct CarouselBodyView: View {
    var index: Int
    @State var offset:CGFloat = 0
    
    var body: some View {
       
        GeometryReader{proxy in
            
            let size =  proxy.size
            
            ZStack{
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: size.width - 8, height: size.height / 1.2)
                    .cornerRadius(12)
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 15.0) {
                        
                        Text("Human Integation Supervisor")
                            .font(.title2).bold()
                            .kerning(1.5)
                        
                        Text("The world's largest collecction of animal facts, pictures and more!")
                            .kerning(1.2)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .leading, spacing: 30){
                            
                            HStack(alignment: .center){
                                
                                Image("model")
                                    .resizable()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 55, height: 55)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
                                VStack(alignment: .leading, spacing: 6){
                                    
                                    Text("Yamamoto")
                                        .font(.title2).bold()
                                    
                                    Text("iOS Developer")
                                        .foregroundColor(.secondary)
                                    
                                }
                                .foregroundColor(.black)
                            }
                            
                            HStack{
                                
                                VStack{
                                    
                                    Text("10")
                                        .font(.title2).bold()
                                    
                                    Text("Posts")
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                
                                VStack{
                                    
                                    Text("1")
                                        .font(.title2).bold()
                                    
                                    Text("Followers")
                                        .foregroundColor(.secondary)
                                }
                                
                                VStack{
                                    
                                    Text("5")
                                        .font(.title2).bold()
                                    
                                    Text("Following")
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                            }
                            .foregroundColor(.black)
                        }
                        .padding(15)
                        .padding(.horizontal, 10)
                        .background(Color.white)
                        
                    }
                    .foregroundColor(.white)
                    .padding(.top)
                    
                    Spacer(minLength: 0)
                }
                .padding(20)
            }
            .frame(width: size.width - 8, height: size.height / 1.0)
            .frame(width: size.width, height: size.height)
            .cornerRadius(12)
        }
        .tag("p\(index)")
        .rotation3DEffect(
            .init(degrees: Double(getProgress())),
            axis: (x: 0, y: 1, z: 0),
            anchor: offset > 0 ? .leading : .trailing,
            anchorZ: 0,
            perspective: 1)
        .modifier(ScrollViewOffsetModifier(anchorPoint: .leading, offset: $offset))

        //.overlay(Text("\(offset)").foregroundColor(.white))
    }
    func getProgress() -> CGFloat{
        let progress = -offset / UIScreen.main.bounds.width * 90
        
        return progress
    }
}

struct CarouselBodyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

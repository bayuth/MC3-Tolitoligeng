//
//  pageIndicator.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct pageIndicator: View {
    
    var progressNumber:Double
    var progressName:String
    var progressDetail:String
    @State var popOverState:Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10, content: {
            HStack{
                ZStack{
                    
                Text("\(Int(progressNumber))/4")
                        .fontWeight(.semibold)
                
                Circle()
                    .stroke(Color(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)), lineWidth: 4)
                    .frame(width: 48, height: 48)
                    
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(progressNumber/4.0))
                    .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: 4)
                    .frame(width: 48, height: 48)
                    .rotationEffect(.degrees(270))
                    
                    
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("\(progressName)")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Button(action: {popOverState.toggle()}, label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                        })
                    }
                    Text("\(progressDetail)")
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                }.padding(.leading,8)
                .padding(.top,10)
                
            }
        }).frame(width: UIScreen.main.bounds.width - 35,
                 alignment: .leading)
    }
}

struct pageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        pageIndicator(progressNumber: 3, progressName: "Ayam", progressDetail: "Geus jalan")
    }
}

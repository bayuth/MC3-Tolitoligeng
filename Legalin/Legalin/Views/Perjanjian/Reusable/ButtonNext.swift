//
//  ButtonNext.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct ButtonNext: View {
    
    var text:String
    
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("\(text)")
                .fontWeight(.semibold)
        }).frame(width: UIScreen.main.bounds.width - 35, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))))
    }
}

struct ButtonNext_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNext(text: "Lanjutkan")
    }
}

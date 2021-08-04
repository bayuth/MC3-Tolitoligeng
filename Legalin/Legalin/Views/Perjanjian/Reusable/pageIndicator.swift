//
//  pageIndicator.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct pageIndicator: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack{
                ZStack{
                    
                Text("4/4")
                        .fontWeight(.semibold)
                Circle()
                    .strokeBorder(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: 4)
                    .frame(width: 48, height: 48, alignment: .center)
                }
                
                VStack(alignment: .leading){
                    Text("Detail Agunan")
                        .font(.body)
                        .fontWeight(.semibold)
                    Text("Langkah terakhir")
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                }.padding(.leading,8)
            }
        }).frame(width: UIScreen.main.bounds.width - 35,
                 alignment: .leading)
    }
}

struct pageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        pageIndicator()
    }
}

//
//  ButtonNext.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI

struct ButtonNext: View {
    
    var text:String
    @State var isDataComplete: Bool
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        
        VStack{
            
            if (text == "Buat Surat"){
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(perjanjianController.nextButtonState ?  Color("tabBarColor") : Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                    .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text("\(text)").fontWeight(.semibold).foregroundColor(.white)
            }.padding(.horizontal)
            } else {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(isDataComplete ?  Color("tabBarColor") : Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                        .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    
                    Text("\(text)").fontWeight(.semibold).foregroundColor(.white)
                }.padding(.horizontal)
            }
        }
    }
}

struct ButtonNext_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNext(text: "Lanjutkan", isDataComplete: false)
    }
}

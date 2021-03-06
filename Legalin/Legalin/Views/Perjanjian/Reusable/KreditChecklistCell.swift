//
//  KreditChecklistCell.swift
//  Legalin
//
//  Created by Achmad Fathullah on 23/08/21.
//

import SwiftUI

struct KreditChecklistCell: View {
    var title: String
    var rupiah: Double
    var selected: Bool
    var mainNav: Bool
    var index:Int
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(selected ? Color(UIColor.systemBackground) : Color("cardColor")).animation(.easeIn(duration: 0.2))
                .frame(width: UIScreen.main.bounds.width - 30, height: 64, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: selected ? 1.5 : 0)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 76, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeIn(duration: 0.2)))

            VStack(alignment: .leading, spacing: 10, content: {
                
                HStack{
                    VStack(alignment:.leading){
                        Text(title)
                            .font(.headline)
                        Text(rupiah.toRupiahString())
                            .font(.body)
                            .fontWeight(.light)
							.foregroundColor(Color("formViewColor"))
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    if (mainNav == false){
    
                        ZStack{
                            
                        Image("selectedIcon")
                            .opacity(selected ? 1 : 0)
                            .animation(.easeIn(duration: 0.2))
                        Circle()
                            .strokeBorder(Color(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)), lineWidth: 2)
                            .frame(width: 25, height: 25, alignment: .center)
                        }.padding(.trailing, 20)
                    } else {
                        
                        VStack{
                        Image(systemName: "chevron.right")
                        }.padding(.trailing, 20)
                        
                    }
                }
                
                
            }).frame(width: UIScreen.main.bounds.width - 30, height: 54
                     , alignment: .leading)
        }.padding(.horizontal, 20.0)
        .padding(.vertical, 2)
    }
}

struct KreditChecklistCell_Previews: PreviewProvider {
    static var previews: some View {
        KreditChecklistCell(title: "halo",rupiah: 400000000, selected: false, mainNav: false, index: 0)
    }
}

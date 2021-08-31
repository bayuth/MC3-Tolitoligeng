//
//  NewCardView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 25/08/21.
//

import SwiftUI

struct NewCardView: View {
//    @ObservedObject var perjanjianController: PerjanjianController = .shared
//    var coreDataVM: CoreDataViewModel = .shared
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("coba")
                    .font(.headline)
                
                Text("item.Date")
                    .font(.body)
                    .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
            }
            .padding(16)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color(#colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.3)))
                .padding(16)
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9725490196, alpha: 1)))
        )
        .frame(maxWidth: .infinity, maxHeight: 60)
        .padding(.horizontal)
        .contentShape(Rectangle())
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView()
    }
}

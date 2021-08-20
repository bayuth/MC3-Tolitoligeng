//
//  inputPicker.swift
//  Legalin
//
//  Created by Jason Hartanto on 19/08/21.
//

import SwiftUI

struct InputPicker: View {
    
    var title: String
    var listItem: [String]
    @Binding var selectedItem: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text(title).font(.footnote).fontWeight(.light).padding(.horizontal)
                .padding(.top)
            
            HStack{
            Picker("\(getPickerTitle(title: selectedItem))", selection: $selectedItem) {
                                ForEach(listItem, id: \.self) {
                                    Text($0)
                                }
                }.pickerStyle(MenuPickerStyle())
            .padding(.horizontal)
                
                Spacer()
                
                Text("A").opacity(0)
                    .padding(.horizontal)
            }
//            .background(Color.red.opacity(0.3))
            
        })
    
    }
}

func getPickerTitle(title: String) -> String{
    if (title == "Detail"){
        return "Tipe Barang"
    } else {
        return title
    }
}

//struct inputPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        inputPicker()
//    }
//}

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
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            
            Text(title).font(.footnote).fontWeight(.light).padding(.horizontal)
            
            VStack{
                HStack{
                    Picker("\(getPickerTitle(title: selectedItem))", selection: $selectedItem) {
                        ForEach(listItem, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(MenuPickerStyle())
                    .padding(.horizontal)
                    .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    
                    Spacer()
                    
                    Text("A").opacity(0)
                        .padding(.horizontal)
                    
                }
                Divider()
            }
            
            .background(Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)).opacity(getRedIndicator() ? 0.05 : 0.0))
            
        })
        
    }
    
    func getRedIndicator() -> Bool{
        if (((selectedItem == "Detail") || (selectedItem == "Metode Pembayaran") || (selectedItem == "Pilih Tanggal")) && (perjanjianController.endButtonPressed == true)){
            return true
        } else {
            return false
        }
    }
}

func getPickerTitle(title: String) -> String{
    if (title == "Detail"){
        return "Tipe Barang"
    } else {
        return title
    }
}

struct inputPicker_Previews: PreviewProvider {
    static var previews: some View {
        InputPicker(title: "yes", listItem: ["yes", "yes"], selectedItem: .constant("Detail"))
    }
}

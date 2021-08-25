//
//  DraftSegmentedView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

struct DraftSegmentedView2: View {
    var item: Pinjaman
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(getSimulasiName(nama: item.kredit?.namaSimulasi ?? "Draft"))
                        .font(.headline)
                    
                    Text(getDateString(inputDate: item.dateModified ?? Date()))
                        .font(.body)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                }
            }
            
        }
        .background(RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))))
        .padding(.horizontal)
        .contentShape(Rectangle())
        
    }
    
    func getSimulasiName(nama: String) -> String{
        if nama == "" {
            return "Draft"
        } else {
            return nama
        }
    }
    
    func getDateString(inputDate: Date) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        let dateFormatting = DateFormatter()
        dateFormatting.dateFormat = "dd/MM/YYYY"
        
        return dateFormatting.string(from: inputDate)
    }
}




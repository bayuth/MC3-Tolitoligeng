//
//  KreditView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 02/08/21.
//

import SwiftUI

struct KreditView: View {
    var bayu = 0
    @StateObject var kreditData = ListKreditVM()
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    if kreditData.list.isEmpty {
                        EmptyState()
                    }else {
                        ForEach(kreditData.list){ item in
                            KreditCardView(item: $kreditData.list[getIndex(item: item)], lists: $kreditData.list)

                        }
                    }
                }
                .navigationTitle("Kredit")
                .navigationBarItems(trailing:
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "plus").imageScale(.large)
                            .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                    }
                    .fullScreenCover(isPresented: $isPresented, content: ModalAddKredit.init)
                )
            }
            
        }
        
    }
    func getIndex(item: ItemListKredit)->Int{
        return kreditData.list.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}



struct KreditView_Previews: PreviewProvider {
    static var previews: some View {
        KreditView()
    }
}

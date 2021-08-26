//
//  KreditView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 02/08/21.
//

import SwiftUI

struct KreditView: View {
    var bayu = 0
    @ObservedObject var kreditData = ListKreditVM()
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    
    var body: some View {
        NavigationView{
            VStack{
                if kreditData.list.isEmpty {
                    EmptyState()
                }else {
                    ScrollView(showsIndicators: false){
                        ForEach(kreditData.list){ item in
                            KreditCardView(item: $kreditData.list[getIndex(item: item)], lists: $kreditData.list, action: {
                                kreditData.deleteKredit(index: getIndex(item: item))
                            })

                        }
                    }
                }
            }
            .navigationTitle("Kredit")
            .navigationBarItems(trailing:
                                    VStack{
                                        Button(action: {
                                            
                                            isPresented.toggle()
                                            
                                        })
                                        {
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(Color("tabBarColor"))
                                        }
                                        .fullScreenCover(isPresented: $isPresented, content: ModalAddKredit.init)
                                    }
            )
            
        }
        
    }
    func getIndex(item: ItemListKredit)->Int{
        return kreditData.list.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func refreshData(){
        kreditData.fillListDone()
    }
}



struct KreditView_Previews: PreviewProvider {
    static var previews: some View {
        KreditView()
            
    }
}

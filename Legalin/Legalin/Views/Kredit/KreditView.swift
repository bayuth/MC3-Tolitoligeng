//
//  KreditView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 02/08/21.
//

import SwiftUI

struct KreditView: View {
    @ObservedObject var kreditData = ListKreditVM()
    @ObservedObject var coreData :CoreDataViewModel = .shared
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    
    var body: some View {
        NavigationView{
            VStack{
                if coreData.listKredit.isEmpty {
                    EmptyState()
                }else {
                    List{
                        ForEach(coreData.listKredit, id:\.uuid){ item in
                            ZStack{
                                NavigationLink(
                                    destination: DetailKredit(kredit: item, index: getIndex(item: item), onDelete: {
                                        kreditData.deleteKredit(index: getIndex(item: item))
                                    }),
                                    label: {
                                        EmptyView()
                                    }
                                )
                                .opacity(0)
                                KreditCardView(item:
                                item
                                )
                            }
                                .foregroundColor(.black)
                                .simultaneousGesture(TapGesture().onEnded{
                                    kreditData.object = kreditData.list[getIndex(item: item)]
                                })
                        }.onDelete(perform: deleteKredit)
                    }.listStyle(PlainListStyle())
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
                                    })
        }
        
    }
    func getIndex(item: Kredit)->Int{
        return kreditData.coreDataVM.listKredit.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func refreshData(){
        kreditData.fillListDone()
    }
    
    private func deleteKredit(at offsets: IndexSet){
        
        for offset in offsets{
            coreData.deleteKredit(kredit: coreData.listKredit[offset])
        }
    }
}



struct KreditView_Previews: PreviewProvider {
    static var previews: some View {
        KreditView()
        
    }
}

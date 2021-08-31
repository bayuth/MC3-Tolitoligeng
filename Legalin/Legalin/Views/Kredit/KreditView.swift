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
    @ObservedObject var coreData :CoreDataViewModel = .shared
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    @State var actionState: Int? = 0
    
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
                                    destination: DetailKredit(kredit: item, onDelete: {
                                        kreditData.fillListDone()
                                    }, actionState: $actionState),
                                    tag: 4, selection: $actionState,
                                    label: {
                                        KreditCardView(item: item)
                                    }
                                )
                                .opacity(0)
                                KreditCardView(item:item)
                                    .simultaneousGesture(TapGesture().onEnded{
                                        actionState = 4
                                    })
                            }
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

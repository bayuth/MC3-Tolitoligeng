//
//  MainPerjanjianPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 26/08/21.
//

import SwiftUI

struct MainPerjanjianPage: View {
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
    }
    @State private var isPresented = false
    @State private var selectedSide: Segment = .onGoing
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: $selectedSide, label: Text("Picker")){
                    ForEach(Segment.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                Spacer()
                ChoosenSegmented(selectedSegment: selectedSide)
                    .onAppear{
                        UIApplication.shared.applicationIconBadgeNumber = 0
                    }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Perjanjian")
            .navigationBarItems(trailing:
                                    VStack{
                                        Button(action: { isPresented.toggle()
                                            perjanjianController.resetValue()
                                        })
                                        {
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                        }
                                        .fullScreenCover(isPresented: $isPresented, content: step1Peminjam.init)
                                    }
            )}
    }
}

enum Segment:String, CaseIterable{
    case onGoing = "Berlangsung"
    case history = "Riwayat"
    case draft = "Draft"
}

struct ChoosenSegmented: View {    
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    var cobaItem = [1, 2, 3, 4]
    
    var selectedSegment: Segment
    var body : some View{
        switch selectedSegment {
        case .onGoing:
            if coreDataVM.listPinjamanOnGoing.isEmpty{
                EmptyStatePerjanjian()
            }
            else{
                List{
                    ForEach(coreDataVM.listPinjamanOnGoing, id:\.uuid){item in
                        ZStack{
                            NavigationLink(
                                destination: DetailPerjanjian(detailPerjanjian: item),
                                label: {
                                    EmptyView()
                                }
                            )
                            .opacity(0)
                            AgreementCardView(item: item)
                        }
                    }.onDelete(perform: deleteOnGoing)
                }
                .listStyle(PlainListStyle())
            }
            
            
        case .history:
            if coreDataVM.listPinjamanDone.isEmpty{
                EmptyStatePerjanjian()
            }
            else{
                List{
                    ForEach(coreDataVM.listPinjamanDone, id:\.uuid){item in
                        ZStack{
                            NavigationLink(
                                destination: DetailPerjanjian(detailPerjanjian: item),
                                label: {
                                    EmptyView()
                                }
                            )
                            .opacity(0)
                            AgreementCardView(item: item)
                        }
                    }.onDelete(perform: deleteHistory)
                }
                .listStyle(PlainListStyle())
            }
            
            
        case .draft:
            if coreDataVM.listPinjamanDraft.isEmpty{
                EmptyStatePerjanjian()
            }
            else{
                List{
                    ForEach(coreDataVM.listPinjamanDraft, id:\.uuid){item in
                        ZStack{
                            NavigationLink(
                                destination: DetailPerjanjian(detailPerjanjian: item),
                                label: {
                                    EmptyView()
                                }
                            )
                            .opacity(0)
                            DraftSegmentedView(item: item)
                        }
                        
                    }.onDelete(perform: deleteDraft)
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    private func deleteDraft(at offsets: IndexSet){
        
        for offset in offsets{
            coreDataVM.deletePinjaman(pinjaman: coreDataVM.listPinjamanDraft[offset])
        }
    }
    private func deleteOnGoing(at offsets: IndexSet){
        
        for offset in offsets{
            coreDataVM.deletePinjaman(pinjaman: coreDataVM.listPinjamanOnGoing[offset])
        }
    }
    private func deleteHistory(at offsets: IndexSet){
        
        for offset in offsets{
            coreDataVM.deletePinjaman(pinjaman: coreDataVM.listPinjamanDone[offset])
        }
    }
}

struct MainPerjanjianPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPerjanjianPage()
    }
}
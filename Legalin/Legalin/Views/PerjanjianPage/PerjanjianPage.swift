//
//  PerjanjianPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 30/07/21.
//

import SwiftUI

struct PerjanjianPage: View {
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color("tabBarColor"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
    }
    
    @State private var isPresented = false
    @State private var selectedSide: AgreementSegment = .onGoing
    @StateObject var agreementData: PerjanjianViewModel = .shared
    @State var offset: CGSize = .zero
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        NavigationView{
            VStack{
                Picker(selection: $selectedSide, label: Text("Picker")){
                    ForEach(AgreementSegment.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                ScrollView(showsIndicators: false){
                    ChoosenSegment(selectedSegment: selectedSide)
                        .onAppear{
                            UIApplication.shared.applicationIconBadgeNumber = 0
                        }
                }
            }
            .navigationTitle("Perjanjian")
            .navigationBarItems(trailing:
                                    VStack{
                                        Button(action: { isPresented.toggle()
                                            perjanjianController.resetValue()
                                        })
                                        {
                                            Image(systemName: "plus")
                                                .font(.title)
                                                .foregroundColor(Color("tabBarColor"))
                                        }
                                        .fullScreenCover(isPresented: $isPresented, content: step1Peminjam.init)
                                    }
            )}
    }
    
    
}
enum AgreementSegment:String, CaseIterable{
    case onGoing = "Berlangsung"
    case history = "Riwayat"
    case draft = "Draft"
}

struct ChoosenSegment: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isPresented = false
    var selectedSegment: AgreementSegment
    @StateObject var agreementData: PerjanjianViewModel = .shared
    @State private var location: CGPoint = CGPoint(x: 0, y: 0)
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @ObservedObject var coreDataVM: CoreDataViewModel = .shared
    
    
    var body: some View{
        switch selectedSegment {
        case .onGoing:
            Text("test")
//            if agreementData.listOnGoing.isEmpty {
//                EmptyStatePerjanjian()
//            }
//            else if agreementData.listOnGoing.count > 0{
//                ForEach(agreementData.listOnGoing){ item in
//                    if item.offset != -160{
//                        NavigationLink(
//                            destination: DetailPerjanjian(detailPerjanjian: agreementData.listOnGoing[getIndex(item: item)].pinjaman),
//                            label: {
//                                AgreementCardView(item: $agreementData.listOnGoing[getIndex(item: item)], lists: $agreementData.listOnGoing)
//                            })
//                            .foregroundColor(.black)
//                            .simultaneousGesture(TapGesture().onEnded{perjanjianController.detailSync(pinjaman: agreementData.listOnGoing[getIndex(item: item)].pinjaman)})
//                    }
//                    else{
//                        AgreementCardView(item: $agreementData.listOnGoing[getIndex(item: item)], lists: $agreementData.listOnGoing)
//                    }
//
//                }
//            }
            
            
        case .history:
            Text("test")
//            if agreementData.listDone.isEmpty {
//                EmptyStatePerjanjian()
//            }
//            else if agreementData.listDone.count > 0{
//                ForEach(agreementData.listDone){ item in
//                    if item.offset != -160{
//                        NavigationLink(
//                            destination: DetailPerjanjian(detailPerjanjian: agreementData.listDone[getIndex2(item: item)].pinjaman),
//                            label: {
//                                HistorySegmentedView(item: $agreementData.listDone[getIndex2(item: item)], lists: $agreementData.listDone)
//                            })
//                            .foregroundColor(.black)
//                            .simultaneousGesture(TapGesture().onEnded{perjanjianController.detailSync(pinjaman: agreementData.listDone[getIndex2(item: item)].pinjaman)})
//                    }
//                    else{
//                        HistorySegmentedView(item: $agreementData.listDone[getIndex2(item: item)], lists: $agreementData.listDone)
//                    }
//                }
//
//            }
            if agreementData.listDone.isEmpty {
                EmptyStatePerjanjian()
            }
            else if agreementData.listDone.count > 0{
                ForEach(agreementData.listDone){ item in
                    if item.offset != -160{
                        NavigationLink(
                            destination: DetailPerjanjian(detailPerjanjian: agreementData.listDone[getIndex2(item: item)].pinjaman),
                            label: {
                                HistorySegmentedView(item: $agreementData.listDone[getIndex2(item: item)], lists: $agreementData.listDone)
                            })
							.foregroundColor(.black)
                            .simultaneousGesture(TapGesture().onEnded{perjanjianController.detailSync(pinjaman: agreementData.listDone[getIndex2(item: item)].pinjaman)})
                    }
                    else{
                        HistorySegmentedView(item: $agreementData.listDone[getIndex2(item: item)], lists: $agreementData.listDone)
                    }
                }
                
            }
        case .draft:
            Text("coba")
            List{
                ForEach(coreDataVM.listPinjamanDraft, id:\.uuid){ item in
                    
                    NavigationLink(
                        destination: DetailPerjanjian(detailPerjanjian: item),
                        label: {
                            DraftSegmentedView(item: item)
                        })
                        .foregroundColor(.black)
                }.onDelete(perform: deleteDraft)
            }
        }
    }
    
    private func deleteDraft(at offsets: IndexSet){
        
        for offset in offsets{
            coreDataVM.deletePinjaman(pinjaman: coreDataVM.listPinjamanDraft[offset])
        }
    }
    
}
//func getInitText(pihak1:[Akun]) -> String{
//    if (pihak1.count == 0) {
//        return "No Profile found"
//    } else{
//        return pihak1[0].ktp?.nama ?? "Name is empty"
//    }
//}
//
//func getButtonText(pihak1:[Akun]) -> String{
//    if (pihak1.count == 0) {
//        return "Create profile and update name"
//    } else{
//        return "Update profile name"
//    }
//}

struct PerjanjianPage_Previews: PreviewProvider {
    static var previews: some View {
        PerjanjianPage()
        
        
    }
}

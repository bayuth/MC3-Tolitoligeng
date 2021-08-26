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
    
    
    var body: some View{
        switch selectedSegment {
        case .onGoing:
            if agreementData.listOnGoing.isEmpty {
                EmptyStatePerjanjian()
            }
            else if agreementData.listOnGoing.count > 0{
                ForEach(agreementData.listOnGoing){ item in
                    if item.offset != -160{
                        NavigationLink(
                            destination: DetailPerjanjian(detailPerjanjian: agreementData.listOnGoing[getIndex(item: item)].pinjaman),
                            label: {
                                AgreementCardView(item: $agreementData.listOnGoing[getIndex(item: item)], lists: $agreementData.listOnGoing)
                            })
                            .foregroundColor(.black)
                            .simultaneousGesture(TapGesture().onEnded{perjanjianController.detailSync(pinjaman: agreementData.listOnGoing[getIndex(item: item)].pinjaman)})
                    }
                    else{
                        AgreementCardView(item: $agreementData.listOnGoing[getIndex(item: item)], lists: $agreementData.listOnGoing)
                    }
                    
                }
            }
            
            
        case .history:
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
            if agreementData.listDraft.count == 0 {
                EmptyStatePerjanjian()
            }
            else{
                ForEach(agreementData.listDraft, id:\.id){ item in
                    if item.offset != -160{
                        NavigationLink(
                            destination: DetailPerjanjian(detailPerjanjian: agreementData.listDraft[getIndex3(item: item)].pinjaman),
                            label: {
                                DraftSegmentedView(item: $agreementData.listDraft[getIndex3(item: item)], lists: $agreementData.listDraft)
                            })
                            .foregroundColor(.black)
                            .simultaneousGesture(TapGesture().onEnded{perjanjianController.detailSync(pinjaman: agreementData.listDraft[getIndex3(item: item)].pinjaman)})
                    }
                    else{
                        DraftSegmentedView(item: $agreementData.listDraft[getIndex3(item: item)], lists: $agreementData.listDraft)
                    }
                }
            }
        }
    }
    
    func getIndex(item: Agreements)->Int{
        return agreementData.listOnGoing.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func getIndex2(item: Agreements)->Int{
        return agreementData.listDone.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func getIndex3(item: Agreements)->Int{
        return agreementData.listDraft.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
}

struct PerjanjianPage_Previews: PreviewProvider {
    static var previews: some View {
        PerjanjianPage()
        
        
    }
}

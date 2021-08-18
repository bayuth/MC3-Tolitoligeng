//
//  PerjanjianPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 30/07/21.
//

import SwiftUI

struct PerjanjianPage: View {
    init(){
        UISegmentedControl.appearance().selectedSegmentTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
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
                
                ScrollView{
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
                                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                        }
                                        .fullScreenCover(isPresented: $isPresented, content: step1Peminjam.init)
                                    }
            )}
    }
    
    
}

//func getIndex(item: Agreements, items: PerjanjianViewModel)->Int{
//    return items.list.firstIndex { (item1) -> Bool in
//        return item.id == item1.id
//        print(item1.id)
//    } ?? 0
//}

enum AgreementSegment:String, CaseIterable{
    case onGoing = "Berlangsung"
    case history = "Riwayat"
    case daft = "Draf"
}

struct ChoosenSegment: View {
    var selectedSegment: AgreementSegment
    @StateObject var agreementData: PerjanjianViewModel = .shared
    @State private var location: CGPoint = CGPoint(x: 0, y: 0)
    
    
    var body: some View{
        switch selectedSegment {
        case .onGoing:
            if agreementData.listOnGoing.isEmpty {
                EmptyStatePerjanjian()
            }
            else if agreementData.listOnGoing.count > 0{
                ForEach(agreementData.listOnGoing){ item in
                    NavigationLink(
                        destination: DetailPerjanjian(),
                        label: {
                            AgreementCardView(item: $agreementData.listOnGoing[getIndex(item: item)], lists: $agreementData.listOnGoing)
                        })
                        .foregroundColor(.black)
                    
                }
            }
            
            
        case .history:
            if agreementData.listDone.isEmpty {
                EmptyStatePerjanjian()
            }
            else if agreementData.listDone.count > 0{
                ForEach(agreementData.listDone){ item in
                    NavigationLink(
                        destination: DetailPerjanjian(),
                        label: {
                            HistorySegmentedView(item: $agreementData.listDone[getIndex2(item: item)], lists: $agreementData.listDone)
                        })
                        .foregroundColor(.black)
                }
                
            }
        case .daft:
            if agreementData.listDraft.isEmpty {
                EmptyStatePerjanjian()
            }
            else if agreementData.listDraft.count > 0{
                ForEach(agreementData.listDraft){ item in
                    NavigationLink(
                        destination: DetailPerjanjian(),
                        label: {
                            DraftSegmentedView(item: $agreementData.listDraft[getIndex3(item: item)], lists: $agreementData.listDraft)
                        })
                        .foregroundColor(.black)
                }
                
            }
        }
    }
    var simpleDrag: some Gesture{
        DragGesture()
            .onChanged{ value in
                self.location = value.location
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

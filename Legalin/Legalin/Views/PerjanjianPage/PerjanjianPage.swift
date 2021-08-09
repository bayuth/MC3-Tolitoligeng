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
    @StateObject var agreementData = PerjanjianViewModel()
    @State var offset: CGSize = .zero
    @StateObject var perjanjianController = PerjanjianController()
    
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
                                                    Button(action: { isPresented.toggle() })
                                                    {
                                                        Image(systemName: "plus")
                                                            .font(.title)
                                                            .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                                    }
                                                    .fullScreenCover(isPresented: $isPresented, content: step1Peminjam.init)
                                                }
        )}.environmentObject(perjanjianController)
    }
    
    func getIndex(item: Agreements)->Int{
        return agreementData.list.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}



enum AgreementSegment:String, CaseIterable{
    case onGoing = "Berlangsung"
    case history = "Riwayat"
    case daft = "Draf"
}

struct ChoosenSegment: View {
    var selectedSegment: AgreementSegment
    @StateObject var agreementData = PerjanjianViewModel()
    @State private var location: CGPoint = CGPoint(x: 0, y: 0)
    
    
    var body: some View{
        switch selectedSegment {
        case .onGoing:
            if agreementData.list.count == 0 {
                EmptyStatePerjanjian()
            }
            else if agreementData.list.count > 0{
                ForEach(agreementData.list){ item in
                    NavigationLink(
                        destination: DetailPerjanjian(),
                        label: {
                            AgreementCardView(item: $agreementData.list[getIndex(item: item)], lists: $agreementData.list)
                        })
                        .foregroundColor(.black)

                }
            }
           
            
        case .history:
            ForEach(agreementData.list){ item in
                HistorySegmentedView(item: $agreementData.list[getIndex(item: item)], lists: $agreementData.list)
            }
        case .daft:
            ForEach(agreementData.list){ item in
                DraftSegmentedView(item: $agreementData.list[getIndex(item: item)], lists: $agreementData.list)
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
        return agreementData.list.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}

struct PerjanjianPage_Previews: PreviewProvider {
    static var previews: some View {
        PerjanjianPage()
            
            
    }
}

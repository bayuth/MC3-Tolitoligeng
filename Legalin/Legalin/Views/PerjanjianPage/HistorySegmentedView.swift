//
//  HistorySegmentedView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

struct HistorySegmentedView: View {
    @Binding var item: Agreements
    @Binding var lists: [Agreements]

    var body: some View {
        ZStack{
            HStack(spacing: 0){
                Spacer()
                Button(action: {
                    withAnimation(.easeIn){
                        deleteItem()
                    }
                }){
                    Image(systemName: "trash.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: 75, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .frame(minWidth: 75, maxHeight: .infinity)
                .background(Color(.red))
                .specCornerRadius(8, corners: [.topRight, .bottomRight])
                
            }
            .padding(.trailing)
            VStack(alignment: .leading){
                Text(item.agreementTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Jumlah Pinjaman")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 2)
                        
                        Text(item.amountOfLoan)
                            .padding(.bottom, 8)
                        
                        Text("Tanggal Pembuatan")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 2)
                        
                        Text(item.Date)
                            .padding(.bottom, 8)
                        
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading){
                        Text("Pemberi Pinjaman")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 2)
                        
                        Text(item.lenderName)
                            .padding(.bottom, 8)
                        
                        Text("Status Tanda Tangan")
                            .font(.footnote)
                            .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                            .padding(.bottom, 2)
                        
                        Text("Belum")
                            .padding(.bottom, 8)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                
            }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9725490196, alpha: 1)))
            )
            .padding(.horizontal)
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
    }
    
    func onChanged(value : DragGesture.Value){
        if value.translation.width < 0 {
            if item.isSwiped{
                item.offset = value.translation.width - 75
            }
            else{
                item.offset = value.translation.width
            }
        }
        
    }
    
    func onEnd(value: DragGesture.Value) {
        if value.translation.width < 0{
            if -value.translation.width > UIScreen.main.bounds.width/2{
                item.offset = -1000
//                deleteItem()
            }
            else if -item.offset > 50{
                item.isSwiped = true
                item.offset = -75
            }
            else{
                item.isSwiped = false
                item.offset = 0
            }
        }
        else{
            item.isSwiped = false
            item.offset = 0
        }
    }
    
    func deleteItem() {
        lists.removeAll{ (item) -> Bool in
            return self.item.id == item.id
        }
    }
}

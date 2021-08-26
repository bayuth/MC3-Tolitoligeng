//
//  KreditCardView.swift
//  Legalin
//
//  Created by Achmad Fathullah on 05/08/21.
//

import SwiftUI

struct KreditCardView: View {
    @Binding var item: ItemListKredit
    @Binding var lists: [ItemListKredit]
    var action: () -> Void
    
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                Spacer()
                Button(action: action){
                    Image(systemName: "trash.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(minWidth: 75, maxHeight: .infinity)
                .background(Color(.red))
                .specCornerRadius(8, corners: [.topRight, .bottomRight])
                
            }
            .padding(.trailing)
            VStack(alignment: .leading){
                Text(item.kreditTitle)
					.foregroundColor(Color("textColor"))
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top, 16)
                
                HStack{
                    VStack(alignment: .leading){
                        Text("Jumlah Pinjaman")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text(item.jumlahPinjaman.toRupiahString())
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Bunga")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(String(format: "%.2f", item.bunga))%")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading){
                        Text("Tenor")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(Int(item.tenor)) bulan")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                        Text("Cicilan Perbulan")
                            .font(.footnote)
                            .foregroundColor(Color("labelColor"))
                            .padding(.bottom, 2)
                        
                        Text("\(generateCicilanPerbulan().toRupiahString())")
							.foregroundColor(Color("textColor"))
                            .padding(.bottom, 8)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color("cardColor"))
            )
            .padding(.horizontal)
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
        }
    }
    
    func generateTotalBunga() -> Double {
        return (item.bunga / 100) / 12 * item.tenor
    }
    
    func generateTotalPinjaman() -> Double {
        return item.jumlahPinjaman * (1 + generateTotalBunga())
    }
    
    func generateCicilanPerbulan() -> Double {
        return generateTotalPinjaman() / item.tenor
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
    
}

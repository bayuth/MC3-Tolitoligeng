//
//  DraftSegmentedView.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

struct DraftSegmentedView: View {
    @Binding var item: Agreements
    @Binding var lists: [Agreements]
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    
    var body: some View {
        ZStack{
            HStack(spacing: 0){
                Spacer()
                Button(action:{
                }){
                    Image(systemName: "square.and.pencil")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .frame(minWidth: 75, maxHeight: .infinity)
                .background(Color(#colorLiteral(red: 0.6705882353, green: 0.7450980392, blue: 0.7843137255, alpha: 1)))
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
            .padding(.horizontal)
            
            HStack{
                VStack(alignment: .leading){
                    Text(item.agreementTitle)
                        .font(.headline)
                    
                    Text(item.Date)
                        .font(.body)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                }
                .padding(16)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color(#colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.262745098, alpha: 0.3)))
                    .padding(16)
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
                item.offset = value.translation.width - 160
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
//                item.offset = -90
                item.offset = -160
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
        perjanjianController.deletePinjaman(pinjaman: item.pinjaman)
    }
}




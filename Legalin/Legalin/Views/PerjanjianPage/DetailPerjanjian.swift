//
//  DetailPerjanjian.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 05/08/21.
//
import Foundation
import UIKit
import SwiftUI

struct DetailPerjanjian: View {
    
    @State var offset: CGFloat = 0
    var pdfIsEmpty : Bool = false
    @State var deleteSuccess: Bool = false
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var actionState: Int?
    
    @State private var isPresented = false
    
    
    var body: some View {
        //        NavigationView{
        ScrollView(.init(), showsIndicators: false){
            TabView{
                    if perjanjianController.statusSurat == "draft"{
                        EmptyPDF()
                    }
                    else{
                        PdfAction(hideSwitch: false)
                    }
                    
                    Pihak1()
                    Pihak2()
                    InfoPinjaman()
                    InfoAgunan(hideButton: true)
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear{
                setupAppearance()
                
            }
            
        }
        .navigationBarTitle("Detail Perjanjian", displayMode: .inline)
		.navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
											Button(action: {
                                    actionState = 0
   									presentationMode.wrappedValue.dismiss()
   								}, label: {
   									Image(systemName: "chevron.left")
   										.foregroundColor(.white)
   									Text("Perjanjian")
   										.foregroundColor(.white)
   								})
   							,trailing:
                                HStack(spacing: 16){
                                    Button(action: {
                                        isPresented.toggle()
                                    }){
                                        Image(systemName: "square.and.pencil")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        
                                    }.fullScreenCover(isPresented: $isPresented, content: step1Peminjam.init)
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                        
                                        self.deleteSuccess = true
                                        print("jalan")
                                    }){
                                        Image(systemName: "trash")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .onChange(of: deleteSuccess, perform: { value in
                                        print("Dismissed!")
                                        actionState = 0
                                        perjanjianController.deletePinjaman(pinjaman: perjanjianController.detailPinjaman!)
                                    })
                                }
        )
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("tabBarColor"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("pageIndicatorColor"))
    }
}
extension View{
    func getwidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
}

//struct DetailPerjanjian_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPerjanjian()
//    }
//}

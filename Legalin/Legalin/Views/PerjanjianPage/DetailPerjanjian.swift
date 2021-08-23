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
    @Binding var item: Agreements
    @Binding var lists: [Agreements]
//    @Binding var item: Agreements
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    @Environment(\.presentationMode) var presentationMode
    var detailPerjanjian: Pinjaman
    
    
//    var subview = [1, 2, 3, 4, 5]
    
    
    var body: some View {
        //        NavigationView{
        ScrollView(.init(), showsIndicators: false){
            TabView{
                if pdfIsEmpty == false{
                    PdfAction(hideSwitch: false)
//                        .tag(subview[0])
                }
                else{
                    EmptyPDF()
                }
                
                Pihak1()
//                    .tag(subview[1])
                Pihak2()
//                    .tag(subview[2])
                InfoPinjaman()
//                    .tag(subview[3])
                InfoAgunan(hideButton: true)
//                    .tag(subview[4])
                if pdfIsEmpty == false{
                    
                }
                else{
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear{
                setupAppearance()
                
            }
            
        }
        //            .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Detail Perjanjian", displayMode: .inline)
        .navigationBarItems(trailing:
                                HStack(spacing: 16){
                                    Button(action: {
                                        
                                    }){
                                        Image(systemName: "square.and.pencil")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        
                                    }
                                    Button(action: {
//                                        print(item.agreementTitle)
                                        perjanjianController.deletePinjamanDetail(pinjaman: detailPerjanjian)
                                        self.deleteSuccess = true
//                                        lists.removeAll{ (item) -> Bool in
//                                            return self.item.id == item.id
//                                        }
                                        print("jalan")
                                    }){
                                        Image(systemName: "trash")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        
                                    }
                                    .onChange(of: deleteSuccess, perform: { value in
                                        self.presentationMode.wrappedValue.dismiss()
                                    })
                                }
        )
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}
extension View{
    func getwidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
}
//extension UINavigationController{
//    override open func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
//        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        navigationBar.standardAppearance = appearance
//    }
//}

//struct DetailPerjanjian_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPerjanjian()
//    }
//}

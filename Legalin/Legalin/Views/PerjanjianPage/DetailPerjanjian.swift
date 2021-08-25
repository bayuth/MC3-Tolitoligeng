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
    var detailPerjanjian: Pinjaman
    
    
//    var subview = [1, 2, 3, 4, 5]
    
    
    var body: some View {
        //        NavigationView{
        ScrollView(.init(), showsIndicators: false){
            TabView{
                if detailPerjanjian != nil{
                    if detailPerjanjian.status == "draft"{
                        EmptyPDF()
                    }
                    else{
                        PdfAction(hideSwitch: false)
                    }
                    
                    Pihak1()
                        .onAppear{
                            print(detailPerjanjian.status)
                        }
                    Pihak2()
                    InfoPinjaman()
                    InfoAgunan(hideButton: true)
                }
                else{
                    Text("Kosong")
                }
                

                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear{
                setupAppearance()
                
            }
            
        }
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
                                        self.presentationMode.wrappedValue.dismiss()
                                        perjanjianController.deletePinjamanDetail(pinjaman: detailPerjanjian)
//                                        self.deleteSuccess = true
                                        
//                                        lists.removeAll{ (item) -> Bool in
//                                            return self.item.id == item.id
//                                        }
                                        print("jalan")
                                    }){
                                        Image(systemName: "trash")
                                            .font(.title3)
                                            .foregroundColor(.white)
                                        
                                    }
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

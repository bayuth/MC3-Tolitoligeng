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
    
    
    var subview = [1, 2, 3, 4, 5]
    
    
    var body: some View {
        NavigationView{
            ScrollView(.init()){
                TabView{
                    PdfAction()
                        .tag(subview[0])
                    Pihak1()
                        .tag(subview[1])
                    Pihak2()
                        .tag(subview[2])
                    InfoPinjaman()
                        .tag(subview[3])
                    InfoAgunan()
                        .tag(subview[4])
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .onAppear{
                    setupAppearance()
                    
                }
                
            }.navigationBarBackButtonHidden(true)
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
                                            
                                        }){
                                            Image(systemName: "trash")
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                        }
                                    }
            )
            
        }
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

struct DetailPerjanjian_Previews: PreviewProvider {
    static var previews: some View {
        DetailPerjanjian()
    }
}

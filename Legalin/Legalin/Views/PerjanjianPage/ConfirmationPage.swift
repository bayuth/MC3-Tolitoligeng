//
//  ConfirmationPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 07/08/21.
//

import SwiftUI

struct ConfirmationPage: View {
    @State var offset: CGFloat = 0
    var subview = [1, 2, 3, 4, 5]
    //    var position = 0
    
    var body: some View {
        ScrollView(.init()){
            TabView{
                Pihak1()
                    .tag(subview[1])
                Pihak2()
                    .tag(subview[2])
                InfoPinjaman()
                    .tag(subview[3])
                VStack{
                    InfoAgunan(hideButton: false)
                        .tag(subview[4])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear{
                setupAppearance()
            }
        }
        .navigationBarTitle("Konfirmasi", displayMode: .inline)
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
}
struct ConfirmationPage_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationPage()
    }
}

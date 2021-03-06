//
//  ConfirmationPage.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 07/08/21.
//

import SwiftUI

struct ConfirmationPage: View {
    @State var offset: CGFloat = 0
    @Environment(\.presentationMode) var masterPresentationMode5
    @Environment(\.presentationMode) var presentationMode
//    var item: Pinjaman
    var subview = [1, 2, 3, 4, 5]
    //    var position = 0
    
    var body: some View {
        ScrollView(.init(), showsIndicators: false){
            TabView{
                Pihak1()
                    .tag(subview[1])
                Pihak2()
                    .tag(subview[2])
                InfoPinjaman()
                    .tag(subview[3])
                VStack{
                    InfoAgunan(hideButton: false, masterPresentationMode6: _masterPresentationMode5)
                        .tag(subview[4])
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .onAppear{
                setupAppearance()
            }
        }
        .navigationBarTitle("Konfirmasi", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                    Text("Kembali")
                                        .foregroundColor(.white)
                                })
        )
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("tabBarColor"))
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(Color("pageIndicatorColor"))
    }
    
}
//struct ConfirmationPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmationPage()
//    }
//}

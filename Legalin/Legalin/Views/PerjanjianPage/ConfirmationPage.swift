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
//                Pihak1(pinjaman: item)
//                    .tag(subview[1])
//                Pihak2(pinjaman: item)
//                    .tag(subview[2])
//                InfoPinjaman(pinjaman: item)
//                    .tag(subview[3])
//                VStack{
//                    InfoAgunan(hideButton: false, masterPresentationMode6: _masterPresentationMode5, pinjaman: item)
//                        .tag(subview[4])
//                }
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
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
}
//struct ConfirmationPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfirmationPage()
//    }
//}

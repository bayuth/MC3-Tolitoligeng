//
//  DisclaimerPopUp.swift
//  Legalin
//
//  Created by Rahmannur Rizki Syahputra on 18/08/21.
//

import SwiftUI

struct DisclaimerPopUp: View {
    @Binding var shouldShowOnBoarding: Bool
    var body: some View {
//        NavigationView{
            ZStack{
                if shouldShowOnBoarding{
                    Color.black
                        .opacity(0.4)
                        .ignoresSafeArea()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7, alignment: .center)
                            .foregroundColor(.white)
                        VStack(alignment: .center) {
                            VStack {
                                Image("Logo Round")
                                    .resizable()
                                    .frame(width: 56, height: 56, alignment: .center)
                                
                            }.padding(.horizontal, UIScreen.main.bounds.width / 2.5)
                            
                            VStack(alignment: .leading) {
                                Text("\nKebijakan Privasi Legalin\n").font(.headline)
                                Text("Kebijakan Privasi merupakan ketentuan yang harus dibaca, dipahami, dan disetujui oleh Pengguna mengakses atau menggunakan aplikasi Legalin\n").font(.subheadline)
                                Text("Lihat Kebijakan Privasi di sini\n").font(.subheadline)
                                NavigationLink(
                                    destination: PrivacyPolicyView(),
                                    label: {
                                        Text("Kebijakan Privasi")
                                            .font(.body)
                                            .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                                            .padding(.horizontal)
                                    })
    //                                .padding()
    //                            Button(action: {
    //                                PrivacyPolicyView()
    //                            }, label: {
    //                                Text("Kebijakan Privasi").font(.body)
    //                                    .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
    //                                    .padding(.horizontal)
    //                            })
                                Text("\nDengan menyatakan Setuju, Anda menerima segala isi Kebijakan Privasi\n").font(.subheadline)
                            }
                            //                ButtonNext(text: "Setuju", isDataComplete: true)
                            Button(action: {
                                shouldShowOnBoarding = false
                            }, label: {
                                Text("Setuju")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                            })
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                            .specCornerRadius(8, corners: .allCorners)
                                                    Spacer()
                        }.padding()
                        
                    }
                    .clipped()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.8, alignment: .center)
                    .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/1.3)
                    
                    .transition(.move(edge: .bottom))
                }
            }
            .edgesIgnoringSafeArea(.top)
            .animation(.easeInOut)
            
//        }
    }
}

struct DisclaimerPopUp_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerPopUp(shouldShowOnBoarding: .constant(true))
    }
}

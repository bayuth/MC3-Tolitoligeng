//
//  loadingScreen.swift
//  Legalin
//
//  Created by Jason Hartanto on 07/08/21.
//

import SwiftUI

struct loadingScreen: View {
    
    @State private var progressAmount: Double = 0
    
    let timer = Timer.publish(every: 0.02, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack{
            NavigationView{
            NavigationLink(
                destination: GeneratePDF(),
                isActive: .constant(progressAmount == 100)
                ){
            
                VStack{
                
            Text("Membuat Surat")
                .font(.title).padding(.bottom,25)
            
            Image("loadingIcon").padding(.vertical,25)
            
            ProgressView("",value: progressAmount, total: 100)
                .frame(width: UIScreen.main.bounds.width - 35,
                        alignment: .leading)
                .padding(.vertical,20)
                .accentColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                .scaleEffect(x: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/, y: 2.0)
                .onReceive(timer){ _ in
                if progressAmount < 100 {
                    progressAmount += 1
                }
                
            }
                }
            }.buttonStyle(PlainButtonStyle())
        }
        }.navigationBarHidden(true)
    }
}

struct loadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        loadingScreen()
    }
}

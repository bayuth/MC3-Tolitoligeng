//
//  FormViewWithInfo.swift
//  Legalin
//
//  Created by Achmad Fathullah on 09/08/21.
//

import SwiftUI
import DYPopoverView

struct FormViewWithInfo: View {
    @State var title:String
    @Binding var profileValue:String
    @State var showButton = false
    @State var showButtonInfo = false
    @State private var popOverState:Bool = false
    @State private var secondPopoverFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height:120 )
    @State private var testOriginFrame: CGRect = .zero
    @State var info: String
    @State var buttonTitle: String
    
    var body: some View {
        ZStack{
            VStack{
                Text("A").hidden()
                    .anchorView(viewId: "infoPopOver")
                    .anchorFrame(rect: $testOriginFrame)
            }
            VStack(alignment: .leading) {
                HStack{
                    Text(title).font(.footnote).fontWeight(.light)
                    if(showButtonInfo){
                        Button(action: {
                            
                            popOverState.toggle()
                            
                            
                        }, label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                        })
                    }
                }
                HStack{
                    Text(profileValue).font(.body)
                    Spacer()
                    if(showButton){
                        Button(action: {
                            print("Edit button was tapped")
                        }) {
                            HStack(spacing: 10) {
                                Text(buttonTitle).foregroundColor(Color.init(hex: "#C4C4C4"))
                                Image(systemName: "chevron.right").foregroundColor(Color.init(hex: "#C4C4C4"))
                            }
                        }
                    }
                    
                }
                .padding(.top, 4)
                Divider()
                
            }
            
            .padding(.bottom)
        }.popoverView(content: {PopOverContent(frame: $secondPopoverFrame, show: $popOverState, popOverText: info)}, background: {Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))}, isPresented: $popOverState, frame: $secondPopoverFrame, anchorFrame: nil, popoverType: .popover, position: .bottom, viewId: "infoPopOver", settings: DYPopoverViewSettings(arrowLength: 0,  cornerRadius: (10,10,10,10), offset: CGSize(width: 0, height: -25), animation: .default)
        )
        
        
    }
}

//struct FormViewWithInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        FormViewWithInfo(title: "halo", profileValue: "halo", showButton: false, showButtonInfo: true,info: "dsa", buttonTitle: "halo")
//    }
//}

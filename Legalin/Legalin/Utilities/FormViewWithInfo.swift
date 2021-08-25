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
    
    @ObservedObject var perjanjianController: PerjanjianController = .shared
    
    var body: some View {
        ZStack{
            VStack{
                Text("A").hidden()
                    .anchorView(viewId: "infoPopOver")
                    .anchorFrame(rect: $testOriginFrame)
                    .padding(.horizontal)
            }
            VStack(alignment: .leading) {
                HStack{
                    Text(title).font(.footnote).fontWeight(.light).padding(.bottom, 14)
                    if(showButtonInfo){
                        Button(action: {
                            
                            popOverState.toggle()
                            
                            
                        }, label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                        })
                    }
                }.padding(.horizontal)
                
                
                if(title == "Pengadilan Negeri") {
                    
                    VStack{
                    HStack{
                        Text("Pengadilan Negeri").font(.body)
                        Spacer()
                        if(showButton){
                            Button(action: {
                                perjanjianController.modalPengadilanNegeri.toggle()
                            }) {
                                HStack {
                                    Text(profileValue).foregroundColor(Color.init(hex: "#C4C4C4"))
                                    Image(systemName: "chevron.right").foregroundColor(Color.init(hex: "#C4C4C4"))
                                }
                            }
                        }
                        
                    }.padding(.horizontal)
					.background(Color("defaultLightAndDarkColor"))
                    .sheet(isPresented: $perjanjianController.modalPengadilanNegeri)
                    {
                        NavigationView{
                            ModalPengadilanNegeri(isPresented: $perjanjianController.modalPengadilanNegeri, pengadilanNegeri: $profileValue)
                        }
                    }
                    Divider()
                    }.background(Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)).opacity(getRedIndicator() ? 0.05 : 0.0))
                }
                
                else {
                    
                    VStack{
                        Text(profileValue).font(.body)
                            .padding(.horizontal)
                            .foregroundColor(Color.init(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Divider()
                    }.background(Color(#colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)).opacity(getRedIndicator() ? 0.05 : 0.0))
                    
                }
                
            }
            
        }.popoverView(content: {PopOverContent(frame: $secondPopoverFrame, show: $popOverState, popOverText: info)}, background: {Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))}, isPresented: $popOverState, frame: $secondPopoverFrame, anchorFrame: nil, popoverType: .popover, position: .bottom, viewId: "infoPopOver", settings: DYPopoverViewSettings(arrowLength: 0,  cornerRadius: (10,10,10,10), offset: CGSize(width: 0, height: -25), animation: .default)
        )
        
    }
    func getRedIndicator() -> Bool{
        if (((profileValue == "Pilih") || (profileValue == "Pilih Tanggal")) && (perjanjianController.endButtonPressed == true)){
            return true
        } else {
            return false
        }
    }
}

//struct FormViewWithInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        FormViewWithInfo(title: "halo", profileValue: "halo", showButton: false, showButtonInfo: true,info: "dsa", buttonTitle: "halo")
//    }
//}

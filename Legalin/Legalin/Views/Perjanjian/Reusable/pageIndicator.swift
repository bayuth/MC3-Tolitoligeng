//
//  pageIndicator.swift
//  Legalin
//
//  Created by Jason Hartanto on 04/08/21.
//

import SwiftUI
import DYPopoverView

struct pageIndicator: View {
    
    var progressNumber:Double
    var progressName:String
    var progressDetail:String
    
    @State private var testOriginFrame: CGRect = .zero
    @State var popOverState:Bool = false
    @State private var secondPopoverFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 30, height:100 )
    
    var body: some View {
        
        GeometryReader{ proxy in
            
        VStack(alignment: .leading, spacing: 10, content: {
            HStack{
                ZStack{
                    
                Text("\(Int(progressNumber))/4")
                        .fontWeight(.semibold)
                
                Circle()
                    .stroke(Color(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)), lineWidth: 4)
                    .frame(width: 48, height: 48)
                    
                Circle()
                    .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: CGFloat(progressNumber/4.0))
                    .stroke(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: 4)
                    .frame(width: 48, height: 48)
                    .rotationEffect(.degrees(270))
                    
                }
                
                VStack(alignment: .leading){
                    HStack{
                        Text("\(progressName)")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Button(action: {
                                
                            popOverState.toggle()
                            
                            
                        }, label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)))
                        }).anchorView(viewId: "infoPopOver")
                        .anchorFrame(rect: $testOriginFrame)
                    }
                    Text("\(progressDetail)")
                        .font(.subheadline)
                        .foregroundColor(Color(#colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)))
                }.padding(.leading,8)
                .padding(.top,10)
                
            }
        }).frame(width: UIScreen.main.bounds.width - 35,
                 alignment: .leading)
        
        }.popoverView(content: {PopOverContent(frame: $secondPopoverFrame, show: $popOverState)}, background: {Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1))}, isPresented: $popOverState, frame: $secondPopoverFrame, anchorFrame: nil, popoverType: .popover, position: .bottom, viewId: "infoPopOver", settings: DYPopoverViewSettings(arrowLength: 0,  cornerRadius: (10,10,10,10), offset: CGSize(width: -15, height: 10), animation: .default)
        ).frame(width: UIScreen.main.bounds.width, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct pageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        pageIndicator(progressNumber: 3, progressName: "Ayam", progressDetail: "Geus jalan")
    }
}
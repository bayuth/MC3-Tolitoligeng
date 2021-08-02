import SwiftUI

struct CheckListCell: View{
    
    var title: String
    var selected: Bool
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(selected ? Color.black.opacity(0) : Color(#colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9725490196, alpha: 1)))
                .frame(width: UIScreen.main.bounds.width - 30, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color(#colorLiteral(red: 0.06274509804, green: 0.2784313725, blue: 0.4117647059, alpha: 1)), lineWidth: selected ? 1.5 : 0)
                            .frame(width: UIScreen.main.bounds.width - 30, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
            
            VStack(alignment: .leading, spacing: 10, content: {
                
                HStack{
                    Text(title)
                        .font(.title3)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    ZStack{
                        
                    Image("selectedIcon")
                        .opacity(selected ? 1 : 0)
                    Circle()
                        .strokeBorder(Color(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)), lineWidth: 2)
                        .frame(width: 25, height: 25, alignment: .center)
                    }.padding(.trailing, 20)
                }
                
                
            }).frame(width: UIScreen.main.bounds.width - 30, height: 54
                     , alignment: .leading)
        }.padding(.horizontal, 20.0)
    }
    
}

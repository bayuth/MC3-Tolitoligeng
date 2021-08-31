import SwiftUI

struct CheckListCell: View{
    
    var title: String
    var selected: Bool
    var mainNav: Bool
    var index:Int
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(selected ? Color(UIColor.systemBackground) : Color("cardColor")).animation(.easeIn(duration: 0.2))
                .frame(width: UIScreen.main.bounds.width - 30, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color("tabBarColor"), lineWidth: selected ? 1.5 : 0)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 54, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).animation(.easeIn(duration: 0.2)))

            VStack(alignment: .leading, spacing: 10, content: {
                
                HStack{
                    Text(title)
                        .font(.title3)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    if (mainNav == false){
    
                        ZStack{
                            
                        Image("selectedIcon")
                            .opacity(selected ? 1 : 0)
                            .animation(.easeIn(duration: 0.2))
                        Circle()
                            .strokeBorder(Color(#colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)), lineWidth: 2)
                            .frame(width: 25, height: 25, alignment: .center)
                        }.padding(.trailing, 20)
                    } else {
                        
                        VStack{
                        Image(systemName: "chevron.right")
                        }.padding(.trailing, 20)
                        
                    }
                }
                
                
            }).frame(width: UIScreen.main.bounds.width - 30, height: 54
                     , alignment: .leading)
        }.padding(.horizontal, 20.0)
        .padding(.vertical, 2)
    }
    
}

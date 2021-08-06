//
//MinimizableView Example
//
//  Created by Dominik Butz on 6/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import SwiftUI

struct PopOverContent: View {

    @State var expanded: Bool = false
    @Binding var frame: CGRect
    @Binding var show: Bool
    
    var body: some View {
        GeometryReader { proxy in

                VStack(alignment: .center) {

                    HStack (alignment: .top) {
                            
                            Text("Barang berharga yang dititipkan oleh peminjam dana (debitur) ke pemberi pinjaman (kreditur) sebagai jaminan.").foregroundColor(.white)
                            
                                Spacer()
                            
                            
                                Button(action: {
                                    self.show = false
                                }) {
                                    Image(systemName: "xmark.circle").font(.system(size: 20)).foregroundColor(Color.white)
                                }
                            
                    }.padding()
                
                }
        }
    }
}


struct ContentExample_Previews: PreviewProvider {
    static var previews: some View {
        PopOverContent(frame: .constant(CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.75, height:150 )), show: .constant(true))
    }
}



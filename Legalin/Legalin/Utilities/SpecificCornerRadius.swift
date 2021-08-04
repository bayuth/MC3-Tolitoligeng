//
//  SpecificCornerRadius.swift
//  Legalin
//
//  Created by Bayu Triharyanto on 04/08/21.
//

import SwiftUI

extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(SpecificCornerRadius(radius: radius, corners: corners))
    }
}

struct SpecificCornerRadius: Shape {
    
    var radius : CGFloat = .infinity
    var corners : UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path{
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

struct SpecificCornerRadius_Previews: PreviewProvider {
    static var previews: some View {
        SpecificCornerRadius(radius: 200, corners: [.bottomLeft, .topRight])
            .padding()
            .frame(width: 400, height: 200)
    }
}

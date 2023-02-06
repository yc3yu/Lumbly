//
//  Color+Presets.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-30.
//

import SwiftUI
import UIKit

extension Color {
    public static let prussianBlue   = Color(UIColor(hex: "#00204A") ?? .black)
    
    public static let oysterBay      = Color(UIColor(hex: "#D9FAFF") ?? .black)
    
    public static let resolutionBlue = Color(UIColor(hex: "#00367D") ?? .black)
    
    public static let blueCharcoal   = Color(UIColor(hex: "#000A17") ?? .black)
    
    public static let mercuryGray    = Color(UIColor(hex: "#E9E9E9") ?? .black)
    
    public static let anakiwaBlue    = Color(UIColor(hex: "#A6F3FF") ?? .black)
}

struct ColorPresets_Previews: PreviewProvider {
    static let padding: CGFloat = 5
    static let boxHeight: CGFloat = 100
    
    static var previews: some View {
        VStack(spacing: ColorPresets_Previews.padding) {
            HStack(spacing: ColorPresets_Previews.padding) {
                Rectangle().foregroundColor(Color.prussianBlue)
                
                Rectangle().foregroundColor(Color.oysterBay)
                
                Rectangle().foregroundColor(Color.resolutionBlue)
            }
            .frame(height: ColorPresets_Previews.boxHeight)
            
            HStack(spacing: ColorPresets_Previews.padding) {
                Rectangle().foregroundColor(Color.blueCharcoal)
                
                Rectangle().foregroundColor(Color.mercuryGray)
                
                Rectangle().foregroundColor(Color.anakiwaBlue)
            }
            .frame(height: ColorPresets_Previews.boxHeight)
            
            Spacer()
        }
        .padding(ColorPresets_Previews.padding)
    }
}

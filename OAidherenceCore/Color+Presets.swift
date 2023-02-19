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
    
    public static let oysterBay      = Color(UIColor(hex: "#EDFDFF") ?? .black)
    
    public static let mercuryGrey    = Color(UIColor(hex: "#E9E9E9") ?? .black)

    public static let blueCharcoal   = Color(UIColor(hex: "#000A17") ?? .black)

    public static let resolutionBlue = Color(UIColor(hex: "#00367D") ?? .black)
    
    public static let veniceBlue     = Color(UIColor(hex: "#075985") ?? .black)
    
    public static let sinbadBlue     = Color(UIColor(hex: "#A8D0D6") ?? .black)
}

struct ColorPresets_Previews: PreviewProvider {
    static let verticalPadding: CGFloat = 5
    static let horizontalPadding: CGFloat = 20
    static let boxWidth: CGFloat = 100
    static let textWidth: CGFloat = 150
    
    static var previews: some View {
        VStack(spacing: ColorPresets_Previews.verticalPadding) {
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.prussianBlue)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("prussianBlue")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.oysterBay)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("oysterBay")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.mercuryGrey)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("mercuryGrey")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.blueCharcoal)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("blueCharcoal")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.resolutionBlue)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("resolutionBlue")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.veniceBlue)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("veniceBlue")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            HStack(spacing: ColorPresets_Previews.horizontalPadding) {
                Rectangle().foregroundColor(Color.sinbadBlue)
                    .frame(width: ColorPresets_Previews.boxWidth)
                Text("sinbadBlue")
                    .frame(width: ColorPresets_Previews.textWidth)
            }
            
            Spacer()
        }.padding(ColorPresets_Previews.verticalPadding)
    }
}

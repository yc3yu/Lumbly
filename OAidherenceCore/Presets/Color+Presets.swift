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
    
    public static let lightSecondary = Color(UIColor(hex: "#3C3C4399") ?? .black)
    
    public static let darkGray03     = Color(UIColor(hex: "#48484A") ?? .black)
    
    public static let darkGray06     = Color(UIColor(hex: "#1C1C1E") ?? .black)
}

struct ColorPresets_Previews: PreviewProvider {
    private struct Constants {
        static let verticalPadding: CGFloat = 5
        static let horizontalPadding: CGFloat = 20
        static let boxWidth: CGFloat = 100
        static let boxHeight: CGFloat = 80
        static let textWidth: CGFloat = 150
    }
    
    static var previews: some View {
        ScrollView {
            VStack(spacing: Constants.verticalPadding) {
                Group {
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.prussianBlue)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("prussianBlue")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.oysterBay)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("oysterBay")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.mercuryGrey)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("mercuryGrey")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.blueCharcoal)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("blueCharcoal")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.resolutionBlue)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("resolutionBlue")
                            .frame(width: Constants.textWidth)
                    }
                }
                
                Group {
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.veniceBlue)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("veniceBlue")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.sinbadBlue)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("sinbadBlue")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.lightSecondary)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("lightSecondary")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.darkGray03)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("darkGray03")
                            .frame(width: Constants.textWidth)
                    }
                    
                    HStack(spacing: Constants.horizontalPadding) {
                        Rectangle().foregroundColor(Color.darkGray06)
                            .frame(width: Constants.boxWidth, height: Constants.boxHeight)
                        Text("darkGray06")
                            .frame(width: Constants.textWidth)
                    }
                }
                
                Spacer()
            }
        }
        .padding(Constants.verticalPadding)
    }
}

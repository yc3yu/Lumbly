//
//  Font+Presets.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-30.
//

import SwiftUI

extension Font {
    
    // MARK: Regular fonts
    
    public static let caption2Regular: Font = Font.system(.caption2)
    
    public static let caption1Regular: Font = Font.system(.caption)
    
    public static let bodyRegular: Font = Font.system(.body)
    
    public static let title3Regular: Font = Font.system(.title3)
    
    public static let title2Regular: Font = Font.system(.title2)
        
    public static let title1Regular: Font = Font.system(.title)
    
    public static let largeTitleRegular: Font = Font.system(.largeTitle)
    
    // MARK: Bold fonts
    
    public static let caption2Bold: Font = Font.system(.caption2).weight(.semibold)
    
    public static let caption1Bold: Font = Font.system(.caption).weight(.medium)
    
    public static let bodyBold: Font = Font.system(.body).weight(.semibold)
    
    public static let title3Bold: Font = Font.system(.title3).weight(.semibold)
    
    public static let title2Bold: Font = Font.system(.title2).weight(.bold)
    
    public static let title1Bold: Font = Font.system(.title).weight(.bold)
    
    public static let largeTitleBold: Font = Font.system(.largeTitle).weight(.bold)
    
}

struct FontPresets_Previews: PreviewProvider {
    static let padding: CGFloat = 5
    
    static var previews: some View {
        VStack {
            VStack {
                Text("Caption2 Regular")
                    .font(.caption2Regular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Caption1 Regular")
                    .font(.caption1Regular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Body Regular")
                    .font(.bodyRegular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title3 Regular")
                    .font(.title3Regular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title2 Regular")
                    .font(.title2Regular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title1 Regular")
                    .font(.title1Regular)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Large Title Regular")
                    .font(.largeTitleRegular)
                    .padding([.top], FontPresets_Previews.padding)
            }
            
            VStack {
                Text("Caption2 Bold")
                    .font(.caption2Bold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Caption1 Bold")
                    .font(.caption1Bold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Body Bold")
                    .font(.bodyBold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title3 Bold")
                    .font(.title3Bold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title2 Bold")
                    .font(.title2Bold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Title1 Bold")
                    .font(.title1Bold)
                    .padding([.top], FontPresets_Previews.padding)
                
                Text("Large Title Bold")
                    .font(.largeTitleBold)
                    .padding([.top], FontPresets_Previews.padding)
            }
            
            Spacer()
        }
    }
}

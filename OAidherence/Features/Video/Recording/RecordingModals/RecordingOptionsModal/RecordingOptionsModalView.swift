//
//  RecordingOptionsModalView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-04-05.
//

import SwiftUI

struct RecordingOptionsModalView: View {
    private struct Constants {
        let backgroundOpacity: CGFloat = 0.8
        let cornerRadius: CGFloat = 10.0
    }
    
    private let constants = Constants()
    
    var viewModel: RecordingOptionsModalViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            Text(viewModel.text)
                .font(.bodyRegular)
                .foregroundColor(.blueCharcoal)
                .multilineTextAlignment(.center)
                .padding(.horizontal, .mediumSpace)
                .padding(.bottom, .smallSpace)
            
            if viewModel.showOptions {
                VStack(spacing: .zero) {
                    Divider()
                        .foregroundColor(.blueCharcoal)
                    
                    HStack(spacing: .mediumSpace) {
                        makeOptionView(text: viewModel.leftOption ?? L10n.RecordingOptionsModalView.yes)

                        Divider()
                        
                        makeOptionView(text: viewModel.rightOption ?? L10n.RecordingOptionsModalView.no)
                    }
                    .padding(.horizontal, .mediumSpace)
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(.top, .smallSpace)
        .background(
            RoundedRectangle(cornerRadius: constants.cornerRadius, style: .continuous)
                .fill(Color.white.opacity(constants.backgroundOpacity))
        )
    }

    func makeOptionView(text: String) -> some View {
        Text(text)
            .font(.bodyRegular)
            .foregroundColor(.resolutionBlue)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, .littleSpace)
            .padding(.bottom, .smallSpace)
    }
}



struct RecordingOptionsModalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)

            VStack(spacing: .mediumSpace) {
                RecordingOptionsModalView(viewModel: .init(text: L10n.RecordingOptionsModalView.putDeviceOnGround, showOptions: false))
                
                RecordingOptionsModalView(viewModel: .init(text: L10n.RecordingOptionsModalView.reviewRecording, showOptions: true))
                
                RecordingOptionsModalView(viewModel: .init(text: L10n.RecordingOptionsModalView.reviewRecording, showOptions: true, leftOption: "This is an example of a long left option", rightOption: "Short"))
            }
            .padding()
        }
    }
}

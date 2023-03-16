//
//  RecordingView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-16.
//

import SwiftUI

struct RecordingView: View {
    var body: some View {
        HostedRecordingViewController()
            .ignoresSafeArea(.container, edges: .horizontal)
    }
}

//
//  TestView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-26.
//

import SwiftUI

extension TestView {
    struct ViewModel {
        var name: String
    }
}

struct TestView: View {
    let viewModel: ViewModel?
    
    var body: some View {
        if let name = viewModel?.name {
            Text(name)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(viewModel: TestView.ViewModel(name: "Anne"))
    }
}

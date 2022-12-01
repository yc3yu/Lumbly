//
//  ResultsView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-11-29.
//

import SwiftUI

extension ResultsView {
    struct ViewModel {
        var name: String
    }
}

struct ResultsView: View {
    let viewModel: ViewModel?
    
    var body: some View {
        if let name = viewModel?.name {
            Text(name)
        }
        
        Text("hi")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(viewModel: ResultsView.ViewModel(name: "Anne"))
    }
}


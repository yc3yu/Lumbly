//
//  LoginView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-10-26.
//

import SwiftUI

extension LoginView {
    struct ViewModel {
        var name: String
    }
}

struct LoginView: View {
    let viewModel: ViewModel?
    
    var body: some View {
        if let name = viewModel?.name {
            Text(name)
        }
        
        Text("hi")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginView.ViewModel(name: "Anne"))
    }
}

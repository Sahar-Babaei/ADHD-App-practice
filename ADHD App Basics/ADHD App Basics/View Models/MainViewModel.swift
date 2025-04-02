//
//  MainViewModel.swift
//  ADHD App Basics
//
//  Created by Ricardo Haro on 2025-04-01.
//

import Foundation

class MainViewModel: ObservableObject {

    @Published var toastVisible: Bool = false
    
    func startToast() {
        toastVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.toastVisible = false
        }
    }
}

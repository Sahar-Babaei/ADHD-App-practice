//
//  MainViewModel.swift
//  ADHD App Basics
//
//  Created by Ricardo Haro on 2025-04-01.
//

import Foundation

class MainViewModel: ObservableObject {

    @Published var creationToastVisible: Bool = false
    @Published var editionToastVisible: Bool = false
    
    func startToast() {
        creationToastVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.creationToastVisible = false
        }
    }
    
    func editionToast() {
        editionToastVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.editionToastVisible = false
        }
    }
}

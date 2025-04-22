//
//  Importance.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-04-20.
//

import Foundation
import SwiftUICore

enum Importance : Codable, CaseIterable {
    case asap, soon, wait ,none
    
    var name : String {
        switch self {
        case .asap: return "Do asap"
        case .soon: return "Do Soon"
        case .wait: return "Can Wait"
        case .none: return "none"
            
        }
        
    }
    
    var color : Color {
        switch self {
        case .asap: return Color(.red)
        case .soon: return Color(.green)
        case .wait: return Color(.gray)
        case .none: return Color("BodyCopy")
        }
        
    }
    
}

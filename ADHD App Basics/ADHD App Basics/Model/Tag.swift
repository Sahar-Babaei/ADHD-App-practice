//
//  Tag.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-27.
//

import Foundation
import SwiftUICore

enum Tag : Codable {
    case school, health, misc, work, personal, none
    
    var name : String {
        switch self {
            case .school: return "School"
            case .health: return "Health"
            case .misc: return "Misc."
            case .work: return "Work"
            case .personal: return "Personal"
            case .none: return "No tag"
        }
        
    }
    
    var color : Color {
        switch self {
            case .school: return Color("TagTeal")
            case .health: return Color("TagOrange")
            case .misc: return Color("TagIndigo")
            case .work: return Color("TagPurple")
            case .personal: return Color("TagPink")
            case .none: return Color("TagNoColor")
        }
        
    }
    
}

//
//  Status.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-29.
//

import Foundation
import SwiftUICore

enum Status : Codable {
    case notStarted, plannedForToday, completed
    
    var name : String {
        switch self {
        case .notStarted: return "Not Started"
        case .plannedForToday: return "Planned for Today"
        case .completed: return "Completed"
        }
        
    }
    
    var bodyColor : Color {
        switch self {
        case .notStarted: return Color("GreyStatusBody")
        case .plannedForToday: return Color("YellowStatusBody")
        case .completed: return Color("GreenStatusBody")
        }
        
    }
    var backgroundColor : Color {
        switch self {
        case .notStarted: return Color("GreyStatusBackground")
        case .plannedForToday: return Color("YellowStatusBackground")
        case .completed: return Color("GreenStatusBackground")
        }
    }
}

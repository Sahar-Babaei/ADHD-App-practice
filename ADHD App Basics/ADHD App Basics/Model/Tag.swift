//
//  Tag.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-27.
//

import Foundation
import SwiftUICore
import SwiftUI

struct Tag: Identifiable, Codable, Hashable {
    var id: UUID = UUID()
    var type: TagType
    var customName: String? = nil

    var name: String {
        customName ?? type.defaultName
    }

    var color: Color {
        type.color
    }

    enum TagType: String, CaseIterable, Codable {
        case school, life, misc, work, hobby, none

        var defaultName: String {
            switch self {
                case .school: return "School"
                case .life: return "Life"
                case .misc: return "Misc."
                case .work: return "Work"
                case .hobby: return "Hobby"
                case .none: return "No tag"
            }
        }

        var color: Color {
            switch self {
                case .school: return Color("TagTeal")
                case .life: return Color("TagOrange")
                case .misc: return Color("TagIndigo")
                case .work: return Color("TagPurple")
                case .hobby: return Color("TagPink")
                case .none: return Color("TagNoColor")
            }
        }
    }
}

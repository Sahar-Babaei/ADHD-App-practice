//
//  TagDropDownMenu.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-03-31.
//

import SwiftUI

struct TagDropDownMenu: View {
    @State private var isExpanded = false
    @Binding var selectedTag: Tag
    @State private var editingTagID: UUID?
    @State private var editedName: String = ""

    // Sample tags you might store in a view model or as static defaults
    @State private var availableTags: [Tag] = Tag.TagType.allCases.map {
        Tag(type: $0)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Image(systemName: "tag")
                        .foregroundColor(selectedTag.color)
                    Text(selectedTag.name)
                        .font(Font.custom("Helvetica", size: 15))
                        .foregroundColor(selectedTag.color)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("FieldBackground"))
                .cornerRadius(12)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                ForEach($availableTags, id: \.id) { $tag in
                    VStack(alignment: .leading) {
                        if editingTagID == tag.id {
                            HStack {
                                TextField("Enter name", text: $editedName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                Button("Save") {
                                    tag.customName = editedName
                                    editingTagID = nil
                                }
                            }
                            .padding(.horizontal)
                        } else {
                            HStack {
                                Image(systemName: "tag")
                                    .font(.system(size: 14))
                                    .foregroundColor(tag.color)
                                Text(tag.name)
                                    .font(Font.custom("Helvetica", size: 14))
                                    .foregroundColor(tag.color)

                                Spacer()
                                Button(action: {
                                    editedName = tag.name
                                    editingTagID = tag.id
                                }) {
                                    Image(systemName: "pencil")
                                        .foregroundColor(.gray)
                                }
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                selectedTag = tag
                                isExpanded = false
                            }
                        }
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                }
                .padding(.bottom, 6)
            }
        }
        .background(Color("FieldBackground"))
        .cornerRadius(12)
    }
}

// Test View
struct aView: View {
    @State private var selectedTag: Tag = Tag(type: .none)

    var body: some View {
        VStack(spacing: 20) {
            TagDropDownMenu(selectedTag: $selectedTag)
        }
        .padding()
    }
}

struct aView_Previews: PreviewProvider {
    static var previews: some View {
        aView()
    }
}



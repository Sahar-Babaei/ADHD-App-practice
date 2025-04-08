//
//  FilterPicker.swift
//  ADHD App Basics
//
//  Created by Kirsten W on 2025-04-05.
//
//
import SwiftUI
//
//struct FilterPickerModel: Identifiable{
//    let id: UUID = UUID()
//    var parent: String
//    var children: [String]
//}
//
//var pickers: [FilterPickerModel]{
//    [FilterPickerModel(parent: "Status", children: ["Not Started", "Planned for Today", "Complete"]),
//     FilterPickerModel(parent: "Tag", children: ["School", "Health", "Misc.", "Work","Personal", "No tag"])
//    ]
//}
//struct MultiplePickerView: View {
//    @State var sensor: String = "no sensor selected"
//    var body: some View {
//        Form{
//            Text(sensor)
//            ForEach(pickers){picker in
//                Section(header: Text(picker.parent)){
//                    Picker("", selection: $sensor){
//                        ForEach(picker.children, id:\.description){child in
//                            Text(child)
//                                //Make sure tag is unique across pickers
//                                .tag("Filtered \(picker.parent):  \(child)")
//                        }
//                    }.pickerStyle(InlinePickerStyle())
//                        .labelsHidden()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    MultiplePickerView()
//}

//import SwiftUI
//
//struct FilterPickerModel: Identifiable {
//    let id: UUID = UUID()
//    var parent: String
//    var children: [String]
//}
//
//var pickers: [FilterPickerModel] {
//    [
//        FilterPickerModel(parent: "Status", children: Status.allCases.map {$0}),
//        FilterPickerModel(parent: "Tag", children: ["School", "Health", "Misc.", "Work", "Personal", "No tag"])
//    ]
//}
//
//struct MultiplePickerView: View {
//    @Binding var selectedSensor: String
//
//    var body: some View {
//        Form {
//            Text(selectedSensor)
//            ForEach(pickers) { picker in
//                Section(header: Text(picker.parent)) {
//                    Picker("", selection: $selectedSensor) {
//                        ForEach(picker.children, id: \.self) { child in
//                            Text(child)
//                                .tag("Filtered \(picker.parent):  \(child)")
//                        }
//                    }
//                    .pickerStyle(InlinePickerStyle())
//                    .labelsHidden()
//                }
//            }
//        }
//    }
//}
//
//struct FilterPickerView: View {
//    @State private var selectedSensor: String = "no sensor selected"
//    @State private var showOverlay = false
//
//    var body: some View {
//        ZStack {
//            VStack(spacing: 20) {
//                Text("Selected: \(selectedSensor)")
//
//                Button("Filter Options") {
//                    withAnimation {
//                        showOverlay.toggle()
//                    }
//                }
//            }
//
//            // Hover Panel Overlay
//            if showOverlay {
//                Color.black.opacity(0.3) // background dim
//                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        withAnimation {
//                            showOverlay = false
//                        }
//                    }
//
//                VStack {
//                    Spacer()
//
//                    VStack {
//                        MultiplePickerView(selectedSensor: $selectedSensor)
//                            .frame(width: 350, height: 620)
//                            .background(.ultraThinMaterial)
//                            .clipShape(RoundedRectangle(cornerRadius: 20))
//                            .shadow(radius: 10)
//                    }
//                    .padding(.bottom, 100) // hover position
//                }
//                .transition(.move(edge: .bottom))
//            }
//        }
//    }
//}
//
//
//#Preview {
//    FilterPickerView()
//}
//

struct FilterPickerModel: Identifiable {
    let id = UUID()
    var parent: String
    var children: [Any] // Allows enums or strings
}

var pickers: [FilterPickerModel] {
    [
        FilterPickerModel(parent: "Clear all filters", children: ["All"]),
        FilterPickerModel(
            parent: "Status",
            children: Status.allCases.map { $0 } // Passing enums directly
        ),
        FilterPickerModel(
            parent: "Tag",
            children: Tag.allCases.map { $0 }
        )
    ]
}

struct MultiplePickerView: View {
    @Binding var selectedSensor: String

    var body: some View {
        Form {
            Text(selectedSensor)
            

            ForEach(pickers) { picker in
                Section(header: Text(picker.parent)) {
                    Picker("", selection: $selectedSensor) {
                        ForEach(picker.children.indices, id: \.self) { index in
                            if picker.parent == "Status", let status = picker.children[index] as? Status {
                                HStack {
                                    Circle()
                                        .fill(status.bodyColor)
                                        .frame(width: 10, height: 10)
                                    Text(status.name)
                                }
                                .tag( (status.name))
                            } else if picker.parent == "Tag", let tag = picker.children[index] as? Tag {
                                HStack {
                                    Image(systemName: "tag")
                                        .foregroundColor(tag.color)
                                    Text(tag.name)
                                }
                                .tag((tag.name))
                            } else if let all = picker.children[index] as? String {
                                HStack {
                                    Text(all)
                                }.tag((all))
                                }
                            
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .labelsHidden()
                    
                }
            }
            .background(.orange)
        }
       
    }
}

struct FilterPickerView: View {
    @State private var selectedSensor: String = "no sensor selected"
    @State private var showOverlay = false

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Selected: \(selectedSensor)")

                Button("Filter Options") {
                    withAnimation {
                        showOverlay.toggle()
                    }
                }
            }

            if showOverlay {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showOverlay = false
                        }
                    }

                VStack {
                    Spacer()

                    VStack {
                        MultiplePickerView(selectedSensor: $selectedSensor)
                            .frame(width: 350, height: 730)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 10)
                    }
                    .padding(.bottom, 50)
                }
                .transition(.move(edge: .bottom))
            }
        }
        .background(.yellow)
        .onChange(of: selectedSensor) {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {
                withAnimation(.easeInOut(duration: 0.35)){
                    showOverlay = false
                }
                selectedSensor = "no sensor selected"
            }
            
        }
        
    }
}

#Preview {
    FilterPickerView()
}

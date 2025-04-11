import SwiftUI





struct StatusDropDownMenu: View {
    @State private var isExpanded: Bool = false
    @Binding var selectedStatus: Status // Use @Binding instead of @State

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    HStack(alignment: .center) {
                        Circle()
                            .fill(selectedStatus.bodyColor)
                            .frame(width: 8, height: 8)
                        Text(selectedStatus.name)
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(selectedStatus.bodyColor)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(selectedStatus.backgroundColor)
                    .cornerRadius(12)
                    //.padding(.leading, 20)
                    
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("FieldBackground"))
                .cornerRadius(12)
                
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(isExpanded ? Color("BodyCopy").opacity(0.2): Color(.clear)),
                        alignment: .bottom
                    )
                
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                ForEach(Status.allCases, id: \.self) { status in
                    HStack(alignment: .center) {
                        Circle()
                            .fill(status.bodyColor)
                            .frame(width: 8, height: 8)
                        
                        Text(status.name)
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(status.bodyColor)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(status.backgroundColor)
                    .cornerRadius(12)
                    .padding(.leading, 35)
                    .frame(maxWidth: .infinity, maxHeight:17, alignment: .leading)
                    .background(.clear)
                    //.transition(.opacity.combined(with: .slide))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedStatus = status
                        isExpanded = false
                    }
                    .padding(.top,8)
                    .padding(.bottom,6)
                }
                .padding(.bottom,8)
                //.padding(.top,12)
                
            }
            
        }
        .background(Color("FieldBackground"))
        .cornerRadius(12)
    }
}

// Test View
struct myView: View {
    @State private var selectedStatus: Status = .notStarted // Define a state variable
    var body: some View {
        VStack(spacing: 20) {
            StatusDropDownMenu(selectedStatus: $selectedStatus) // Pass as binding
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        myView()
    }
}


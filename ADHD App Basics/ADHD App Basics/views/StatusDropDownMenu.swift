import SwiftUI





struct StatusDropDownMenu: View {
    @State private var isExpanded: Bool = false
    @State private var selectedStatus: Status = .notStarted

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    HStack(alignment: .center) {
                        Text(selectedStatus.name) // Display selected status
                            .font(Font.custom("Helvetica", size: 14))
                            .foregroundColor(selectedStatus.bodyColor)
                    }
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                ForEach(Status.allCases, id: \.self) { status in
                    HStack(alignment: .center) {
                        Circle()
                            .fill(status.bodyColor) // Use enum-defined color
                            .frame(width: 8, height: 8)
                        
                        Text(status.name) // Use enum-defined name
                            .font(Font.custom("Helvetica", size: 13))
                            .foregroundColor(status.bodyColor)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(status.backgroundColor) // Use enum-defined background color
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .transition(.opacity.combined(with: .slide))
                    .onTapGesture {
                        selectedStatus = status
                        isExpanded = false
                    }
                    .padding()
                }
            }
        }
    }
}

// Test View
struct myView: View {
    var body: some View {
        VStack(spacing: 20) {
            StatusDropDownMenu()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        myView()
    }
}


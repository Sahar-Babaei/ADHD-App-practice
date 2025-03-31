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
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(Color("GreyStatusBody"))
                        .padding(6)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .buttonStyle(PlainButtonStyle())

            if isExpanded {
                ForEach(Status.allCases, id: \.self) { status in
                    HStack(alignment: .center) {
                        Circle()
                            .fill(status.bodyColor)
                            .frame(width: 8, height: 8)
                        
                        Text(status.name)
                            .font(Font.custom("Helvetica", size: 13))
                            .foregroundColor(status.bodyColor)
                    }
                    .padding(.leading, 8)
                    .padding(.trailing, 12)
                    .padding(.vertical, 4)
                    .background(status.backgroundColor)
                    .cornerRadius(15)
                    .padding(.leading, 20)
                    .transition(.opacity.combined(with: .slide))
                    .onTapGesture {
                        selectedStatus = status // Update the binding value
                        isExpanded = false
                    }
                    .padding(.vertical, 5)
                }
            }
        }
    }
}

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


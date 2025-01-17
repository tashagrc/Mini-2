import SwiftUI

struct CallNotification: View {
    @Binding var showGameOverText: Bool

    var body: some View {
        HStack(spacing: 15) {
            Image("profile")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 5) {
                Text("InstaQueen")
                    .font(.system(size: 15))

                Text("@stephaniejenn")
                    .font(.system(size: 15, weight: .semibold))
            }

            HStack(spacing: 0) {
                Button(action: {
                    // Action when reject button is tapped
                    print("Call Rejected")
                    withAnimation {
                        showGameOverText = true
                    }
                }) {
                    Image(systemName: "phone.down.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(17)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                Button(action: {
                    // Action when accept button is tapped
                    print("Call Accepted")
                    withAnimation {
                        showGameOverText = true
                    }
                }) {
                    Image(systemName: "phone.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
        }
        .padding()
        .frame(width: 370)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 168/255, green: 165/255, blue: 164/255))
                .opacity(0.6)
                .shadow(radius: 5)
        )
        .padding()
    }
}

struct CallNotification_Previews: PreviewProvider {
    static var previews: some View {
        CallNotification(showGameOverText: .constant(false))
    }
}

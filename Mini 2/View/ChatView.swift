//import SwiftUI
//
//struct ChatView: View {
//    let chatRepository = ChatRepository.shared
//    let partner: String
//    @State private var messages: [(String, String)] = []
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                List(messages, id: \.1) { message in
//                    MessageBubble(sender: message.0, text: message.1)
//                        .listRowSeparator(.hidden)
//                }
//                .listStyle(PlainListStyle())
//                .padding(-10)
//            }
//            .onAppear {self.loadMessages()}
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    topProfileBar
//                }
//            }
//        }
//    }
//    
//    private func loadMessages() {
//        self.messages = chatRepository.fetchMessages(for: partner)?.reversed() ?? []
//    }
//    
//    var topProfileBar: some View{
//        HStack {
//            Button(action: {
//                // masi blm bisa back
//            }, label: {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(.greenInstaQ)
//            })
//            ChatProfile(profilePicture: partner, profileName: partner, checkMark: true)
//        }
//    }
//    
//}
//
//struct MessageBubble: View {
//    let sender: String
//    let text: String
//
//    var body: some View {
//        if(sender != "Jasmine"){
//            IncomingChatBubble(message: text)
//        }else{
//            OutgoingChatBubble(message: text)
//        }
//        
//    }
//}
//
//struct ChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatView(partner: "James")
//    }
//}
//
import SwiftUI

struct ConversationView: View {
    @ObservedObject var viewModel = ConversationViewModel()
    @State private var userResponse: String = ""
    @State private var selectedPartner: String = "Steph"
    
    var body: some View {
        VStack {
            if let conversation = viewModel.conversations.first(where: { $0.partner_dialog == selectedPartner }) {
                Text(conversation.start_dialog)
                    .padding()
            } else {
                Text("Loading...")
                    .padding()
            }
            
            Button(action: {
                if let message = viewModel.fetchFirstMessage(for: selectedPartner) {
                    self.userResponse = message.response
                }
            }) {
                Text("Fetch User Response")
            }
            .padding()
            
            if !userResponse.isEmpty {
                Text(userResponse)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}

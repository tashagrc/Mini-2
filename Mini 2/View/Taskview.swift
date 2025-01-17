import SwiftUI

struct PaperBackgroundView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ForEach(0..<Int(geometry.size.height / 40), id: \.self) { _ in
                    Rectangle()
                        .fill(Color.white)
                        .frame(height: 40)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.gray),
                            alignment: .bottom
                        )
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TaskView2: View {
    @StateObject private var viewModel = TaskViewModel()
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                PaperBackgroundView()
                    .frame(width: UIScreen.main.bounds.width)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Task List")
                        .font(.custom("Marker Felt", size: 30))
                        .bold()
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    ForEach(Array(viewModel.tasks.enumerated()), id: \.element.id) { index, task in
                        if viewModel.showTask(at: index) {
                            HStack {
                                Text(task.title)
                                    .font(.custom("Marker Felt", size: 20))
                                    .fontWeight(.light)
                                    .opacity(0.85)
                                    .strikethrough(task.isCompleted)
                                    .onTapGesture {
                                        withAnimation {
                                            viewModel.completeTask(task)
                                        }
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                            }
                            .frame(height: 40, alignment: .topLeading)
                        } else {
                            HStack {
                                Text("")
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 8)
                                Spacer()
                            }
                            .frame(height: 40, alignment: .topLeading)
                        }
                    }
                    Spacer()
                }
              .padding(.horizontal, 0)
            }
        }
    }
}

// Preview
struct TaskView2_Previews: PreviewProvider {
    static var previews: TaskView2 {
        TaskView2()
    }
}

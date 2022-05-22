//
//  TaskMenuHome.swift
//  Task
//
//

import SwiftUI

struct TaskMenuHome: View {
    // Init TaskViewModel Observable
    @StateObject var taskModel: TaskViewModel = .init()
    // Init animation namespace
    @Namespace var animation
    // Fetch request for the database
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(keyPath:\Task.deadline, ascending: false)], predicate: nil, animation: .easeInOut) var tasks: FetchedResults<Task>
    @Environment(\.self) var env
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // Vertical Stack for title
            VStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("Upcoming Tasks")
                        .font(.custom("Helvetica Neue", size: 25).bold())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                
                NavbarItems()
                    .padding(.top, 4)
            }
            .padding()
        }
        // Add task button
        .overlay(alignment: .bottom){
            Button{
                taskModel.openEditTask.toggle()
            } label: {
                Label {
                    Text("Add Task")
                        .font(.custom("Helvetica Neue", size: 20))
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "square.and.arrow.up")
                }
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.black, in: Capsule())
            }
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
        }
        // Pressing addTask button will move to a full screeen cover of options
        .fullScreenCover(isPresented: $taskModel.openEditTask){
            taskModel.resetTaskData()
        } content: {
        AddTaskView()
            .environmentObject(taskModel)
        }
    }
    
    // Vertical Task View for the task cards
    @ViewBuilder
    func TaskView() -> some View{
        LazyVStack(spacing: 20){
            ForEach(tasks){task in
                TaskRowView(task: task)
            }
        }
        .padding(.top, 20)
    }
    
    // Horizontal Task View for inside task cards
    @ViewBuilder
    func TaskRowView(task: Task)-> some View{
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                // Edit button
                if !task.isCompleted{
                    Button{
                        
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }
                }
            }
            Text(task.title ?? "")
                .font(.title2.bold())
                .foregroundColor(.black)
                .padding(.vertical, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background{
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(task.color ?? "Red"))
        }
    }
    
    
    // Custom segment for navbar menu items
    @ViewBuilder
    func NavbarItems()->some View{
        // Tabs for the different status's
        let tabs = ["Upcoming", "Completed"]
        HStack(spacing: 10){
            ForEach(tabs,id: \.self){ tab in
                Text(tab)
                    .font(.custom("Helvetica Neue", size: 18))
                    .fontWeight(.semibold)
                    .foregroundColor(taskModel.currentTab == tab ? .white : .black)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background{
                        if taskModel.currentTab == tab{
                            Capsule()
                                .fill(.black)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation{
                            taskModel.currentTab = tab
                        }
                    }
                
            }
        }
    }
}

struct TaskMenuHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

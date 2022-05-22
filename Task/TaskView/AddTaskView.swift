//
//  AddTaskView.swift
//  Task
//
//  Created by Wesley Jin on 16/5/22.
//

import SwiftUI
import Photos

struct AddTaskView: View {
    // Init environment object
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.self) var env
    var body: some View {
        // Add task full screen cover
        VStack(spacing: 20){
            Text("Add Task")
                .font(.custom("Helvetica Neue", size: 20).bold())
                .frame(maxWidth: .infinity)
        .overlay(alignment: .leading) {
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "arrow.uturn.left")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.black)
            }
        }
        // Choose colour Vstack
        VStack(alignment: .leading, spacing:20) {
            Text("Choose Task Colour")
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(.black)
                        
            let colours: [String] = ["Red", "Green", "Blue"]
                        
            HStack(spacing: 40) {
                ForEach(colours, id: \.self){
                    color in RoundedRectangle(cornerRadius: 10)
                    .fill(Color(color))
                    .frame(width: 30, height: 30)
                    .background{
                        if taskModel.taskColor == color {
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(.gray)
                                .padding(-5)
                        }
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        taskModel.taskColor = color
                    }
                }
            }
        }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            
            Divider()
            // Setting Date of deadline
            VStack(alignment: .leading, spacing:10) {
                Text("Set Task Date")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.black)
                
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time: .omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted, time: .shortened))
                    .font(.custom("Helvetica Neue", size: 20).bold())
                    .padding(.top, 10)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    taskModel.datePicker.toggle()
                } label: {
                        Image(systemName: "calendar.badge.clock")
                }
            }
            Divider()
            // Adding task name
            VStack(alignment: .leading, spacing:10) {
                Text("Enter Task Name")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(.black)
                
                TextField("Task", text: $taskModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
            }
            
            Divider()
            // Button for storing information into the database
            Button {
                if taskModel.addTask(context: env.managedObjectContext){
                    env.dismiss()
                }
            } label: {
                Text("Add Task!")
                    .font(.custom("Helvetica Neue", size: 20).bold())
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 10)
            .disabled(taskModel.taskTitle == "")
            .opacity(taskModel.taskTitle == "" ? 0.8 : 1)
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        .overlay{
            ZStack{
                if taskModel.datePicker{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture{
                            taskModel.datePicker = false
                        }
                    DatePicker.init("", selection: $taskModel.taskDeadline, in: Date.now...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
            .animation(.easeInOut, value: taskModel.datePicker)
        }
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(TaskViewModel())
    }
}

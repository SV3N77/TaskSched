//
//  AddTaskView.swift
//  Task
//
//  Created by Wesley Jin on 16/5/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var taskModel: TaskViewModel
    @Environment(\.self) var env
    var body: some View {
        VStack(spacing: 10){
            Text("Add Task")
                .font(.title2.bold())
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading) {
            
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    VStack(alignment: .leading, spacing:10) {
                        Text("Choose Task Colour")
                            .font(.title2)
                            .foregroundColor(.black)
                        
                        let colors: [String] = ["Red", "Blue", "Green"]
                    }
                }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

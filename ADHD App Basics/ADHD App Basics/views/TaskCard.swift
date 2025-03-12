//
//  TaskCard.swift
//  ADHD App Basics
//
//  Created by Sahar Babaei on 2025-02-14.
//

import SwiftUI

struct TaskCard: View {
    
//MARK: - Variables
    
//MARK: this page is now for displaying task card info can not make edits here
    //the initialized values are the default states for now
    
    @State var task: Task
    @State private var isTaskCompled = false
    @State private var priorityType = 1
    @State private var selectedPriority: Priority = .none
    
    let allTags = ["School", "Work", "Chores", "Hobbies", "Health"]
    @State private var selectedTags: [String] = []
    @State private var selectedTag: String = ""
    @State private var editingTag: Int?
    @State private var editedTagName: String = ""
    @State private var isEditing: Bool = false
    
    
//    @State private var taskName: String
//    @State private var taskDueDate: Date
//    init(task: Task)    {
//        self.task = task
//        _taskName = State(initialValue: task.taskName)
//        _taskDueDate = State(initialValue: task.taskDueDate)
//    }
    
    

    
//MARK: - body
    var body: some View {
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            HStack{
                //TODO: this combines checkbox with the task title
                Checkbox(isChecked: $isTaskCompled);                TextField("Enter your task here", text: $task.taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            }
            .padding()
            
            ZStack(alignment: .topLeading) {
                TextEditor( text: $task.taskDescription)
                    .frame(height: 75)
                    .cornerRadius(5)
//                    .padding()
                
                if task.taskDescription.isEmpty {
                    Text("Enter task description")
                        .foregroundColor(.gray.opacity(0.5))
                        .padding(.leading)
                        .padding(.top)
                }
                
            }
            .padding()
            
            
            
            //TODO: add due date for task
            DatePicker(selection: $task.taskDueDate, label: { Text("Date") })
                .padding()
            
            //TODO: Need to add a tag system: where user can add x amount of tags plus make new ones: if there's time have each tag has it's own colour
            //make an empty array list for tags: there is a button to add tags to the
            
            //TODO: add priority/importance: use either case of enum or switch
            //~the incremented menu bar
//            VStack {
//                Text("Priority: \(selectedPriority.rawValue)")
//                    .font(.headline)
//                
//                Picker("Priority", selection: $selectedPriority) {
//                    ForEach(Priority.allCases, id: \.self) { priority in
//                        Text(priority.rawValue).tag(priority)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//            }
            //~popoup menu version: we go with this one
            Menu {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Button(priority.rawValue) { selectedPriority = priority}
                    
                }
            } label: {
                HStack {
                    Text((selectedPriority.rawValue))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(10)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(4)
//                    Image(systemName: "chevron.down")
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 230))
            }
            
            // MARK: this code creates a horizontal bar of all the tags available and you can choose to edit or remove them
            
//            VStack{
//                ScrollView(.horizontal, showsIndicators: true){
//                    HStack {
//                        ForEach(tags.indices, id: \.self) { index in
//                            HStack {
//                                Text(tags[index])
//                                    .padding(8)
//                                    .background(Color.blue.opacity(0.2))
//                                    .cornerRadius(8)
//                                
//                                Button(action: {
//                                    editingTag = index
//                                    editedTagName = tags[index]
//                                    editAlert = true
//                                }) {
//                                    Image(systemName: "pencil")
//                                        .foregroundColor(.blue)
//                                }
//                                
//                                Button(action: {
//                                    tags.remove(at:index)
//                                }) {
//                                    Image(systemName: "xmark.circle")
//                                        .foregroundColor(.red)
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//            }
            
            VStack{
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack {
                            Text("Tags:")
                            ForEach(selectedTags, id: \.self) { tag in
                                HStack {
                                    //TODO: is it possible to make the tag label a button to be able to edit the writing/ where should we put were to edit the same
                                    Text(tag)
                                        .padding(.vertical, 8)
                                        .padding(.leading, 10)
                                        .padding(.trailing, isEditing ? 2:10)   // if editing tag expand padding to 10
                                        
    
//                                    Button(action: {
//                                        editingTag = index
//                                        editedTagName = tags[index]
//                                        editAlert = true
//                                    }) {
//                                        Image(systemName: "pencil")
//                                            .foregroundColor(.blue)
//                                    }
                                    //TODO: is there a way to put the remove button inside the label? or
                                    if isEditing == true {
                                        Button(action: {        //removes tag
                                            selectedTags.removeAll {$0 == tag}
                                        
                                        }) {
                                            Image(systemName: "xmark.circle")
                                                .foregroundColor(.red)
                                        }
                                        .padding(.trailing, 10)
                                    }
                                }
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                
                Picker("Select tag", selection: $selectedTag) {
                    ForEach(allTags, id: \.self) { tag in
                        Text(tag).tag(tag)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Button("Add Tag") {
                    if !selectedTag.isEmpty && !selectedTags.contains(selectedTag) {
                        selectedTags.append(selectedTag)
                    }
                }
                .buttonStyle(.bordered)
                
                Button("Edit Tags") {      // basically show the 'x' button is they want to edit the tag, and if they press the button again it will close the button
                    isEditing = !isEditing
//                    if isEditing == true {
//                        isEditing = false
//                    }
                }
                .buttonStyle(.bordered)
                }
        
           
            //need to comment this out bc I dont have a way to switch between priority states
//            switch task.taskPriority {
//            case 1:
//                ZStack{
//                    Text("Low Priority")
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(10)
//                        .background(Color.yellow)
//                        .foregroundColor(.white)
//                        .cornerRadius(4)
//                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 260))
//            case 2:
//                ZStack{
//                    Text("Medium Priority")
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(10)
//                        .background(Color.orange)
//                        .foregroundColor(.white)
//                        .cornerRadius(4)
//                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 260))
//            case 3:
//                ZStack{
//                    Text("Top Priority")
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(10)
//                        .background(Color.red)
//                        .foregroundColor(.white)
//                        .cornerRadius(4)
//                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 260))
//            default:
//                ZStack {
//                    Text("No Priority")
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding(10)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(4)
//                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 260))
//                //is there a way to have this spacing without hardcarding?
//            }
            
        }
        .frame(maxWidth:.infinity, maxHeight: 500)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .padding(.all)
        
        
        
    }
}
enum Priority: String, CaseIterable {
    case none = "Not Started"
    case inProg = "In-progress"
    case paused = "Paused"
    case complete = "Completed"
    
}

#Preview {
    TaskCard(task: Task(taskName: ""))
}


//    var taskName: String = ""                //   <-- Task name
//    var taskStatus: String = "Not Started"   //   <-- Completion status
//    var taskTag = [String]()                 //   <-- Tags associated with it
//    var taskPriority: Int = 0                //   <-- what is the priority (0 is no priority)
//    var taskDuration: Int = 0                //   <-- how long the task would take
//
//    var taskDueDate: Date = Date()           //   <-- the due date for the task
//    var taskReminder: Bool = false           //   <-- reminder to notify you to do the task
//    var taskReminderTime: TimeInterval = 0   //   <-- what time the reminder would go off
//    //TODO: ^not sure if i'm approaching this right
//
//    var taskSubtask: Bool = false            //   <-- will the task have subtasks?
//    //TODO: mentor? ^how do i create variables for subtasks when i don't know how many subtasks there will be?
//
//    var taskCreationDate: Date = Date()      //   <-- time/date the task was created
    
    //idea: add a variable to keep track of "overdue" tasks?
    //try not to store another value ie taskOverdue into its own var if it can be dervieved from a simpler from?
    // to make your own custom textfield: you will need to make a struct and define everything there

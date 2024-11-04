//
//  HomeworkView.swift
//  EasyClassroom
//
//  Created by Łukasz Stachnik on 04/11/2024.
//

import SwiftUI

public struct HomeworkView: View {
    @Observable
    final class Model {
        var teacher: Teacher
        let student1: Student
        let student2: Student

        init() {
            teacher = UsersFactory.createUser(type: .teacher, name: "Łukasz", surname: "Stachnik") as! Teacher
            student1 = UsersFactory.createUser(type: .student, name: "John", surname: "Smith") as! Student
            student2 = UsersFactory.createUser(type: .student, name: "Caroline", surname: "Mushroom") as! Student

            teacher.attach(observer: student1)
            teacher.attach(observer: student2)
        }
    }

    @State var model = Model()

    public var body: some View {
        HStack {
            VStack {
                Text("Teacher: \(model.teacher.name) \(model.teacher.surname)")
                Button {
                    model.teacher.notify(data: "New homework!")
                } label: {
                    Text("Send homework")
                }
            }
        }
    }
}

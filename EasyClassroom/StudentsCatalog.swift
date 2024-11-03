//
//  StudentsCatalog.swift
//  EasyClassroom
//
//  Created by Łukasz Stachnik on 03/11/2024.
//

/// Singleton class repeseting all students on the University, for easy access in the classroom creation or group creation :)
final class StudentsCatalog {
    private let students: [Student]
    private static var instance: StudentsCatalog?

    private init() {
        students = [
            .init(name: "John", surname: "Doe"),
            .init(name: "Jane", surname: "Smith"),
            .init(name: "Michael", surname: "Johnson"),
            .init(name: "Emily", surname: "Davis"),
            .init(name: "Chris", surname: "Brown"),
            .init(name: "Amanda", surname: "Wilson"),
            .init(name: "David", surname: "Anderson"),
            .init(name: "Sophia", surname: "Martinez"),
            .init(name: "James", surname: "Taylor"),
            .init(name: "Olivia", surname: "Harris"),
            .init(name: "Daniel", surname: "Clark"),
            .init(name: "Emma", surname: "Walker"),
            .init(name: "Matthew", surname: "Lee"),
            .init(name: "Abigail", surname: "Hall"),
            .init(name: "Joshua", surname: "Allen"),
            .init(name: "Isabella", surname: "Young"),
            .init(name: "Anthony", surname: "King"),
            .init(name: "Mia", surname: "Scott"),
            .init(name: "William", surname: "Wright"),
            .init(name: "Charlotte", surname: "Adams")
        ]
    }

    static func getInstance() -> StudentsCatalog {
        if let instance {
            return instance
        }

        instance = .init()
        return instance!
    }

    func getStudents() -> [Student] {
        students
    }
}

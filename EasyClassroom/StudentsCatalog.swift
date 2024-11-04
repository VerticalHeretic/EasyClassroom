//
//  StudentsCatalog.swift
//  EasyClassroom
//
//  Created by Łukasz Stachnik on 03/11/2024.
//

enum IteratorError: Error {
    case noMoreElements
}

protocol StudentsIterator {
    func getNext() throws(IteratorError) -> Student
    var hasMore: Bool { get }
}

/// Singleton class representing all students on the University, for easy access in the classroom creation or group creation :)
final class StudentsCatalog: StudentsIterator {
    private var students: [User]
    private static var instance: StudentsCatalog?

    private init() {
        students = [
            UsersFactory.createUser(type: .student, name: "John", surname: "Doe"),
            UsersFactory.createUser(type: .student, name: "Jane", surname: "Smith"),
            UsersFactory.createUser(type: .student, name: "Michael", surname: "Johnson"),
            UsersFactory.createUser(type: .student, name: "Emily", surname: "Davis"),
            UsersFactory.createUser(type: .student, name: "Chris", surname: "Brown"),
            UsersFactory.createUser(type: .student, name: "Amanda", surname: "Wilson"),
            UsersFactory.createUser(type: .student, name: "David", surname: "Anderson"),
            UsersFactory.createUser(type: .student, name: "Sophia", surname: "Martinez"),
            UsersFactory.createUser(type: .student, name: "James", surname: "Taylor"),
            UsersFactory.createUser(type: .student, name: "Olivia", surname: "Harris"),
            UsersFactory.createUser(type: .student, name: "Daniel", surname: "Clark"),
            UsersFactory.createUser(type: .student, name: "Emma", surname: "Walker"),
            UsersFactory.createUser(type: .student, name: "Matthew", surname: "Lee"),
            UsersFactory.createUser(type: .student, name: "Abigail", surname: "Hall"),
            UsersFactory.createUser(type: .student, name: "Joshua", surname: "Allen"),
            UsersFactory.createUser(type: .student, name: "Isabella", surname: "Young"),
            UsersFactory.createUser(type: .student, name: "Anthony", surname: "King"),
            UsersFactory.createUser(type: .student, name: "Mia", surname: "Scott"),
            UsersFactory.createUser(type: .student, name: "William", surname: "Wright"),
            UsersFactory.createUser(type: .student, name: "Charlotte", surname: "Adams")
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
        students.compactMap { $0 as? Student }
    }
    
    // MARK: Students Iterator conformance
    
    private var currentPosition: Int = 0
    func getNext() throws(IteratorError) -> Student {
        guard currentPosition < students.count - 1 else { throw .noMoreElements }
        
        currentPosition += 1
        return students[currentPosition] as! Student
    }
    
    var hasMore: Bool {
        currentPosition < students.count - 1
    }
    
}

//
//  User.swift
//  EasyClassroom
//
//  Created by Łukasz Stachnik on 03/11/2024.
//

import Foundation

enum SubjectsPrivilege {
    case read
    case write
}

protocol Privileged {
    var subjectsPrivileges: Set<SubjectsPrivilege> { get }
}

class User: Identifiable {
    let id: UUID
    let name: String
    let surname: String

    fileprivate init(id: UUID = UUID(), name: String, surname: String) {
        self.id = id
        self.name = name
        self.surname = surname
    }
}

final class Student: User, Privileged, Observer, Equatable {
    
    func update(data: String) {
        print("New homework: \(data)")
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        lhs.id == rhs.id
    }
    
    let subjectsPrivileges: Set<SubjectsPrivilege>
    let studentGroupId: UUID?

    fileprivate init(
        id: UUID = UUID(),
        name: String,
        surname: String,
        studentGroupId: UUID? = nil
    ) {
        self.studentGroupId = studentGroupId
        subjectsPrivileges = .init([.read])
        super.init(id: id, name: name, surname: surname)
    }
}

final class Teacher: User, Privileged, Subject {
    let subjectsPrivileges: Set<SubjectsPrivilege>
    var groupsIds: [UUID]
    var subjectsIds: [UUID]
    var observers: [any Observer] = []

    fileprivate init(id: UUID = UUID(), name: String, surname: String, groupsIds: [UUID], subjectsIds: [UUID]) {
        self.groupsIds = groupsIds
        self.subjectsIds = subjectsIds
        subjectsPrivileges = .init([.write, .read])
        super.init(id: id, name: name, surname: surname)
    }
}


struct StudentGroup: Codable {
    let id: UUID
}

enum UserType {
    case student
    case teacher
}

enum UsersFactory {
    static func createUser(type: UserType, name: String, surname: String) -> User {
        switch type {
        case .student:
            Student(name: name,
                    surname: surname)
        case .teacher:
            Teacher(name: name,
                    surname: surname,
                    groupsIds: [],
                    subjectsIds: [])
        }
    }
}

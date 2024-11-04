//
//  ContentView.swift
//  EasyClassroom
//
//  Created by Łukasz Stachnik on 03/11/2024.
//

import SwiftUI

enum ContentDirections: Hashable {
    case studentsList
}

struct ContentView: View {
    @State var navigationPath = NavigationPath()
    @State var students: [Student] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            HStack {
                Button {
                    navigationPath.append(ContentDirections.studentsList)
                } label: {
                    Text("Open students list")
                }
            }
            .navigationDestination(for: ContentDirections.self) { direction in
                switch direction {
                case .studentsList:
                    VStack {
                        ForEach(students) { student in
                            Text("\(student.name) \(student.surname)")
                        }

                        if StudentsCatalog.getInstance().hasMore {
                            Button {
                                do {
                                    try students.append(StudentsCatalog.getInstance().getNext())
                                } catch {
                                    print(error)
                                }
                            } label: {
                                Text("Next student please :)")
                            }
                        }
                    }
                    .onAppear {
                        if let student = try? StudentsCatalog.getInstance().getNext() {
                            students.append(student)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

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
                        ForEach(StudentsCatalog.getInstance().getStudents()) { student in
                            
                            Text("\(student.name) \(student.surname)")
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

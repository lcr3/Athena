//
//  AthenaApp.swift
//  Athena
//
//  Created by lcr on 2020/12/25.
//

import Firebase
import SwiftUI

@main
struct AthenaApp: App {
    let persistenceController = PersistenceController.shared

    init() {
      FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            KnowledgeListView(viewModel: KnowledgeViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

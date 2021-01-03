//
//  KnowledgeViewModel.swift
//  Athena
//
//  Created by lcr on 2021/01/02.
//

import FirebaseFirestore
import SwiftUI

class KnowledgeViewModel: ObservableObject {
    private let client = APIClient()

    @Published var knowledes: [Knowledge] = []

    init() {
        client.delegate = self
    }

    func fetchData() {
        client.fetch()
    }
}

extension KnowledgeViewModel: APIClientDelegate {
    func successFetch(knowledge: [Knowledge]) {
        self.knowledes = knowledge
    }

    func failedFetch() {

    }
}

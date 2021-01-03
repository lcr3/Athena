//
//  APIClient.swift
//  Athena
//
//  Created by lcr on 2021/01/03.
//

import FirebaseFirestore
import Foundation

class APIClient {
    weak var delegate: APIClientDelegate?
    private var firestore: Firestore

    init(firestore: Firestore = Firestore.firestore()) {
        self.firestore = firestore
    }

    func fetch() {
        firestore
            .collection("version")
            .document("1")
            .collection("knowledges")
            .addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    self.delegate?.failedFetch()
                    return
                }
                let knowledge = documents.map { queryDocumentSnapshot -> Knowledge in
                    let data = queryDocumentSnapshot.data()
                    return Knowledge(data: data)
                }
                self.delegate?.successFetch(knowledge: knowledge)
            }
    }
}

protocol APIClientDelegate: AnyObject {
    func successFetch(knowledge: [Knowledge])
    func failedFetch()
}

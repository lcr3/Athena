//
//  KnowledgeListView.swift
//  Athena
//
//  Created by lcr on 2020/12/25.
//

import SwiftUI

struct KnowledgeListView: View {
    @ObservedObject var viewModel: KnowledgeViewModel

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.0862745098, green: 0.1333333333, blue: 0.231372549, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                })
                Text("28 february, 2020")
                    .foregroundColor(Color.white)
                Spacer()

                Button(action: {
                    viewModel.fetchData()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
                ForEach(viewModel.knowledes) { knowlede in
                    Text(knowlede.title)
                }
            }).padding(.leading, 28)
        }
    }
}

struct KnowledgeListView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = KnowledgeViewModel()
        KnowledgeListView(viewModel: viewModel)
    }
}

struct Knowledge: Identifiable {
    let id: String
    let title: String

    init(id: String, title: String) {
        self.id = id
        self.title = title
    }

    init(data: [String: Any]) {
        self.id = data["title"] as? String ?? ""
        self.title = data["title"] as? String ?? ""
    }

    static func datas() -> [Knowledge] {
        return [Knowledge(id: "1", title: "Motivation"),
                Knowledge(id: "1", title: "Motivation"),
                Knowledge(id: "1", title: "Motivation")]
    }
}

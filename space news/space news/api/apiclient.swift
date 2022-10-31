//
//  apiclient.swift
//  space news
//
//  Created by Ali Erdem Kökcik on 30.10.2022.
//


//api endpoint: https://api.spaceflightnewsapi.net/v3/v3/articles

import Foundation

struct SpaceData : Codable, Identifiable{
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

@MainActor class SpaceAPI : ObservableObject{
    @Published var news: [SpaceData] = []
    func getData(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/v3/articles?_limit=10") else {
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: "error", url: "error", imageUrl: "error", newsSite: "error", summary: "try swiping down to refresh as soon as you have internet", publishedAt: "error")]
                }
                return
            }
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            DispatchQueue.main.async{
                print("loaded new data successfully. articles: \(spaceData.count)")
                self.news = spaceData
            }
        }.resume()
    }
}

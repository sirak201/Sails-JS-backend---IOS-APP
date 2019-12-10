//
//  post.swift
//  fullstack_social_ios
//
//  Created by Sirak on 12/9/19.
//  Copyright © 2019 Sirak Zeray. All rights reserved.
//

import Foundation
import Alamofire


class Post {
    
    var posts = [PostModel]()
    weak var delegate: RefreshTableView?


    public  func fetchPosts() {
        let url = "http://localhost:1337/post"
        Alamofire.request(url)
                 .validate(statusCode: 200..<300)
                 .responseData { (dataResponse) in
                    if let err = dataResponse.error {
                        print(err)
                        return
                    }
                    guard let data = dataResponse.data else {return}
                    do {
                        let posts = try JSONDecoder().decode([PostModel].self, from: data)
                        self.posts = posts
                        self.delegate?.refreshTableView()
                        } catch {
                        print(error)
                    }
                    
        }
    }
}

//
//  HomeController.swift
//  fullstack_social_ios
//
//  Created by Sirak Zeray on 10/12/19.
//  Copyright © 2019 Sirak Zeray. All rights reserved.
//

import Foundation
import LBTATools
import Alamofire
import SDWebImage






class HomeController : UITableViewController {
    
    var post = [Post]()
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = .init(title: "Fetch Post", style: .plain, target: self, action: #selector(fetchPosts))
        navigationItem.leftBarButtonItem = .init(title: "Login", style: .plain, target: self, action: #selector(handleLogin))
    }
    
    
    @objc fileprivate func fetchPosts() {
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
                        let posts = try JSONDecoder().decode([Post].self, from: data)
                        self.post = posts
                        self.tableView.reloadData()
                    } catch {
                        print(error)
                    }
                    
        }
    }
    
    @objc fileprivate func handleLogin() {
        print("Loggining")
        let navControler = UINavigationController(rootViewController: LoginController())
        present(navControler, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let postt = post[indexPath.row]
        cell.textLabel?.text = postt.user.fullName
        cell.textLabel?.font = .boldSystemFont(ofSize: 14)
        cell.imageView?.sd_setImage(with: URL(string: postt.imageUrl))
        cell.detailTextLabel?.text = postt.text
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }

    
    
    
}

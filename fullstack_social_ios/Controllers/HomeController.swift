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


class HomeController : UITableViewController , RefreshTableView {
    
    var post = Post()


    
    override func viewDidLoad() {
        post.delegate = self
        navigationItem.rightBarButtonItem = .init(title: "Fetch Post", style: .plain, target: self, action: #selector(fetchPosts))
        navigationItem.leftBarButtonItem = .init(title: "Login", style: .plain, target: self, action: #selector(handleLogin))
    }
    
    
    @objc fileprivate func fetchPosts() {
        post.fetchPosts()
    }
    
    @objc fileprivate func handleLogin() {
        let navControler = UINavigationController(rootViewController: LoginController())
        present(navControler, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let postt = post.posts[indexPath.row]
        cell.textLabel?.text = postt.user.fullName
        cell.textLabel?.font = .boldSystemFont(ofSize: 14)
        cell.imageView?.sd_setImage(with: URL(string: postt.imageUrl))
        cell.detailTextLabel?.text = postt.text
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    
    /// Delegate
    func refreshTableView() {
           self.tableView.reloadData()
    }

    
    
    
}

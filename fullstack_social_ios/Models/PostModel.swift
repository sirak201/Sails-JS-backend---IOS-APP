//
//  Post.swift
//  fullstack_social_ios
//
//  Created by Sirak on 12/9/19.
//  Copyright © 2019 Sirak Zeray. All rights reserved.
//

import Foundation
struct PostModel: Decodable {
    let id: String
    let user: UserModel
    let text: String
    let imageUrl: String
    let createdAt: Int
}

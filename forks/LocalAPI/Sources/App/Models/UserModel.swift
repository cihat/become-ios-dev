//
//  UserModel.swift
//  App
//
//  Created by Ferhan Akkan on 19.08.2020.
//

import Foundation
import Vapor
import FluentSQLite

struct UserModel: Content {
    var id: UUID?
    var name: String
    var surname: String
    var age: Int
}

extension UserModel: SQLiteUUIDModel {
    static let entity: String = "User"
    // Bunu tanimlama nedenimiz tabloya isim vermek bunu vermez isek modelin adini alir.
}

extension UserModel: SQLiteMigration {}

extension UserModel: Parameter {}

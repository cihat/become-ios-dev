//
//  UserController.swift
//  App
//
//  Created by Ferhan Akkan on 19.08.2020.
//

import Foundation
import Vapor
import FluentSQLite

struct UserController: RouteCollection {
    
    func boot(router: Router) throws {
        
        //        userRoutes.get("/", use: getAll) Hem / koyabilir yada adres eklemeden de kullanabilirsin. as =  userRoutes.get(use: getAll)
        
        // getler query degilse direk link sonuna koy
        
        let userRoutes = router.grouped("user")
        userRoutes.get(use: getAll) // calisiyi
        userRoutes.post(UserModel.self, at: "/", use: postUser) // calisiyi
        userRoutes.get("nameFilterQuery", use: getFilteredQuery) // calisti
        userRoutes.get("nameFilter", String.parameter, use: getFilteredLink) // calisti direk linke yaz /nameFilter/akkaniOS
        userRoutes.delete(UserModel.parameter, use: deleteSelected)
        //user/C41A7709-FADC-4F43-8F69-2A37A83B648A
        
        userRoutes.get(UserModel.parameter, use: getById)
        //user/C41A7709-FADC-4F43-8F69-2A37A83B648A
        
        
    }
    
    func getAll(req: Request) -> Future<[UserModel]> {
        return UserModel.query(on: req).all()
    }
    
    func postUser(req:Request, user: UserModel) throws -> Future<UserModel> {
        return user.save(on: req)
    }
    
    func deleteSelected(req: Request) throws -> Future<UserModel> {
        // direk link uzerinden elte ettigi id nin bu objenin idsi oldugunu anlar ve siler /user/dsafafa uzerinden.
        return try req.parameters.next(UserModel.self).delete(on: req)
    }
    
    
    
    func getById(req:Request) throws -> Future<UserModel> {
        return try req.parameters.next(UserModel.self)
    }

    
    func getFilteredLink(req: Request) throws -> Future<[UserModel]> {
        let surname = try req.parameters.next(String.self)
        return UserModel.query(on: req).filter(\.surname == surname).all()
    }
    
    func getFilteredQuery(req: Request) throws -> Future<[UserModel]> {
        let name = try req.query.get(String.self, at: "name")
        return UserModel.query(on: req).filter(\.name == name).all()
    }
    

    

    
    


}

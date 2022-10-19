<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-5.1-brightgreen.svg" alt="Swift 5.1">
    </a>
</p>

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [End Points](#endpoints)
## Requirements
- iOS 12+
- Swift 4+
- Xcode 9.3+

## Installation

Firstly if you didn't use Vapor before please install vapor.

```ruby
brew tap vapor/tap
brew install vapor/tap/vapor
```

After you did installation clone to your local machine or download source code as zip and extract to folder which you wish.

And last step go to folder location in terminal and enter

```ruby
vapor xcode
```

When it complete generated open .xcodeproject file. Installation completed. You have to do that when did you download from github per one time.


## Usage

When you open code in Xcode firstly you have to select target Run and select device My Mac. Than run app.

<img src="https://github.com/ferhanakkan/LocalApi/blob/master/Sources/App/Models/Screen%20Shot%202020-08-19%20at%2007.28.11.png" width="1070" height="100"/>

If complied successfully it means your local api is running. (When you stop app in xcode debug screen you will see exit 9 which means you local api has ben successfully stoped.)

That api response as json also accept application/json. That local api main goal is to test your service code. You can create,get and delete user in this api. This api include a local database also. That means when you stop or close your app datas never has been lost. 

```ruby
import Foundation

struct UserModel: Codable {
    var id: UUID?  // You shouldn't give UUID to your model because when you post model without UUID api side will generate and register in database. Also in response we will send you model with UUID.
    var name: String?
    var surname: String?
    var age: Int?
}
```

## End Points

Your local Api adress = http://localhost:8080

### Get End Points

http://localhost:8080/user/ -> Returns all users saved on database. Returns [UserModel] as json.

http://localhost:8080/user/{id} -> Return user in this id number. Returns UserModel as json.

http://localhost:8080/user/nameFilter/{userSurname} -> Returns all objects which name property is userName. Returns [UserModel] as json.

http://localhost:8080/user/nameFilterQuery?name=userSurame -> Returns all objects which name property is userSurame with param in query. Returns [UserModel] as json.

### Post End Points
http://localhost:8080/user/ -> Create a new user. You will send user object as json. Returns UserModel as json.

### Delete End Points
http://localhost:8080/user/C41A7709-FADC-4F43-8F69-2A37A83B648A -> Delete object with UUID.Returns UserModel as json.


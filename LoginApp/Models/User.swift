//
//  User.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 08.11.2022.
//




struct User {
    let login: String
    let password: String
    let person: Person
}

struct Person {
    let name: String
    let surname: String
    let liveIn: String
    let company: String
    var fullName: String {
        name + " " + surname
    }
}


extension User {
    static func getUsers() -> User {
        User(
            login: "User",
            password: "1234",
            person: Person(
                name: "Ярослав",
                surname: "Кочкин",
                liveIn: "РП Горный НСО",
                company: "АО БЭТ"
            )
        )
    }
}

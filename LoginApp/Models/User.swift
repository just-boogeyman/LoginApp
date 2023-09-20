//
//  User.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 18.09.2023.
//


struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "user",
            password: "1234",
            person: Person.getPerson()
        )
    }

}

struct Person {
    let name: String
    let surname: String
    let mail: String
    let telegram: String
    let aboutMe: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Ярослав",
            surname: "Кочкин",
            mail: "kochkin.2328@inbox.ru",
            telegram: "just_yarikk",
            aboutMe: "Привет, меня зовут Ярослав я из поселка городского типа рп Горный (почти в Новосибирске),"
                   + "люблю спорт и сериалы, гулять и веселиться)"
        )
    }
}

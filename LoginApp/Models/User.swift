//
//  User.swift
//  LoginApp
//
//  Created by Ярослав Кочкин on 18.09.2023.
//


struct User {
    static let login = "user"
    static let password = "1234"
    let person: Person
    
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

struct Person {
    let name: String
    let surname: String
    let mail: String
    let telegram: String
    let aboutMe: String
    
}

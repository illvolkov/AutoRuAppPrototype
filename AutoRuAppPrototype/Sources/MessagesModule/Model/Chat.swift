//
//  Chat.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 22.09.2022.
//

struct Chat {
    let image: String
    let title: String
    let subTitle: String
    let lastMessage: String?
    let dateOfLastMessage: String
    
    static func getData() -> [Chat] {
        return [
            Chat(image: "auto.ru",
                 title: "Авто.ру",
                 subTitle: "Чат с поддержкой",
                 lastMessage: "Привет! С вами бот 🤖 С чем нужна помощь?",
                 dateOfLastMessage: "15:23"),
            Chat(image: "inspection.assistant",
                 title: "Помощник осмотра",
                 subTitle: "Покажу всё, что скрыто",
                 lastMessage: "Привет! ✌️",
                 dateOfLastMessage: "10 июля"),
            Chat(image: "notification.center",
                 title: "Центр уведомлений",
                 subTitle: "Канал новостей и предложений",
                 lastMessage: "Выбираете машину? 🚗 Нет смысла тянуть дальше с покупкой",
                 dateOfLastMessage: "19 апреля")
        ]
    }
}

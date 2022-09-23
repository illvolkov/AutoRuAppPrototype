//
//  PromotionSection.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 23.09.2022.
//

struct PromotionSection {
    let type: PromotionSectionType
    let promotions: [Promotion]
    
    static func getData() -> [Self] {
        return [
            PromotionSection(type: .promoWithButton, promotions: [
                Promotion(image: "garage",
                          subImage: nil,
                          title: "Поставьте автомобиль в Гараж",
                          subTitle: "И всегда будете в курсе спецпредложений дилеров, акций, отзывных кампаний и актуальной цены. А подтвержденным собственникам - отчет по VIN от ПроАвто в подарок!")]),
            
            PromotionSection(type: .promo, promotions: [
                Promotion(image: "gold.card",
                          subImage: nil,
                          title: "Золотая карта от Колесо.ру",
                          subTitle: "Поставьте машину в Гараж, чтобы получить возможность воспользоваться акцией."),
                Promotion(image: "osago",
                          subImage: nil,
                          title: "Скидка на каско и ОСАГО до 25%",
                          subTitle: "Добавляйте машину в Гараж и оформляйте каско онлайн со скидкой"),
                Promotion(image: "report",
                          subImage: nil,
                          title: "Отчет ПроАвто в подарок!",
                          subTitle: "Подтвердите, что вы собственник, и получите отчет ПроАвто в подарок! А при продаже автомобиля в вашем объявлении появится бейдж \"Продает собственник\" - это привлечет больше покупателей."),
                Promotion(image: "car.valuation",
                          subImage: nil,
                          title: "Оценка автомобиля",
                          subTitle: "Мы определим рыночную стоимость вашей машины и будем показывать цены в объявлениях других пользователей за вычетом этой суммы")]),
            
            PromotionSection(type: .discount, promotions: [
                Promotion(image: "gas.discount", subImage: "yandex.gas", title: "Скидка на первую заправку", subTitle: nil),
                Promotion(image: "reason.to.return", subImage: "lucky.motors", title: "Повод вернуться в Lucky Motors", subTitle: nil),
                Promotion(image: "evening.discounts", subImage: "lucky.motors", title: "Вечерние скидки на работе и запчасти", subTitle: nil),
                Promotion(image: "service.discount", subImage: "lucky.motors", title: "Скидка 15% на обслуживание", subTitle: nil)
            ]),
            
            PromotionSection(type: .promo, promotions: [
                Promotion(image: "pro.avto",
                          subImage: nil,
                          title: "Полная история вашего автомобиля",
                          subTitle: "Все ли вы знаете о своей машине? Соберем данные из десятков источников: ДТП, юридические ограничения, пробеги, обслуживание, предыдущие размещения на Авто.ру и многое другое."),
                Promotion(image: "revocable",
                          subImage: nil,
                          title: "Отзывные кампании",
                          subTitle: "Быстрее всех узнавайте о возможности бесплатно заменить детали в автомобиле, если их качество вызвало сомнения производителя."),
                Promotion(image: "polis",
                          subImage: nil,
                          title: "Храните страховой полис в Гараже Авто.ру",
                          subTitle: "Добавьте полис в Гараж, чтобы он всегда был под рукой. Вам не придется вспоминать, когда срок действия истечет или искать телефон страховой при ДТП")])
        ]
    }
}

//
//  TransportSection.swift
//  AutoRuAppPrototype
//
//  Created by Ilya Volkov on 20.09.2022.
//

struct TransportSection {
    let type: SectionType
    let transports: [Transport]
    
    static func getData() -> [TransportSection] {
        return [
            TransportSection(type: .news, transports: [
                Transport(image: "attention", price: nil, title: nil, subTitle: nil),
                Transport(image: "china", price: nil, title: nil, subTitle: nil),
                Transport(image: "focus", price: nil, title: nil, subTitle: nil),
                Transport(image: "niva", price: nil, title: nil, subTitle: nil),
                Transport(image: "pledge", price: nil, title: nil, subTitle: nil),
                Transport(image: "podcasts", price: nil, title: nil, subTitle: nil)]),
            
            TransportSection(type: .recentlyWatched, transports: [
                Transport(image: "toyota", price: nil, title: "Toyota Supra V (A90)", subTitle: "1 параметр"),
                Transport(image: "bmw", price: nil, title: "BMW 1 серии (E81/E82/E87/E88 Рестрайлинг", subTitle: "1 параметр"),
                Transport(image: "bmw", price: nil, title: "BMW M3", subTitle: "1 параметр"),
                Transport(image: "bmw", price: nil, title: "BMW M2", subTitle: "1 параметр")]),
            
            TransportSection(type: .segmented, transports: [
                Transport(image: nil, price: nil, title: nil, subTitle: nil)]),
            
            TransportSection(type: .listWithBackgroundView, transports: [
                Transport(image: "car.fill", price: nil, title: "Марка, модель", subTitle: nil),
                Transport(image: "slider.vertical.3", price: nil, title: "Параметры", subTitle: nil)]),
            
            TransportSection(type: .list, transports: [
                Transport(image: "chevron.forward", price: nil, title: "Рассчитать кредит", subTitle: "Подбор автомобиля по платежу")]),

            TransportSection(type: .cars, transports: [
                Transport(image: "bmw1", price: "12 400 000 Р", title: "BMW M3 VI (G80)", subTitle: "2021, 8 000 км"),
                Transport(image: "bmw2", price: "1 750 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2017, 90 000 км"),
                Transport(image: "bmw3", price: "2 399 999 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2017, 86 000 км"),
                Transport(image: "bmw4", price: "900 000 Р", title: "BMW 1 серии (E81/E82/E87/E88) Рестайлинг", subTitle: "2008, 137 142 км"),
                Transport(image: "bmw5", price: "2 000 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2016, 97 400 км"),
                Transport(image: "bmw6", price: "1 627 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2016, 88 717 км"),
                Transport(image: "bmw7", price: "2 400 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2017, 71 700 км"),
                Transport(image: "bmw8", price: "13 300 000 Р", title: "BMW M3 VI (G80)", subTitle: "2022, 900 км"),
                Transport(image: "bmw9", price: "1 950 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2016, 75 000 км"),
                Transport(image: "bmw10", price: "1 500 000 Р", title: "BMW 1 серии (E81/E82/E87/E88) Рестайлинг", subTitle: "2010, 86 800 км"),
                Transport(image: "bmw11", price: "2 150 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2016, 40 000 км"),
                Transport(image: "bmw12", price: "2 100 000 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2015, 120 000 км"),
                Transport(image: "hondaS2000", price: "1 000 000 Р", title: "Honda S2000 I (AP1)", subTitle: "1999, 125 000 км"),
                Transport(image: "bmw13", price: "4 195 000 Р", title: "BMW M3 V (F80)", subTitle: "2018, 54 300 км"),
                Transport(image: "rivian", price: "11 933 260 Р", title: "Rivian R1T", subTitle: "2022, 4 км"),
                Transport(image: "bmw14", price: "10 900 000 Р", title: "BMW M3 VI (G80)", subTitle: "2021, 7 900 км"),
                Transport(image: "bmw15", price: "1 688 900 Р", title: "BMW 3 серии VI (F3x) Рестайлинг", subTitle: "2016, 112 856 км"),
                Transport(image: "buick", price: "2 200 000 Р", title: "Buick Special I", subTitle: "1942, 28 689 км"),
                Transport(image: "bmw16", price: "11 900 000 Р", title: "BMW M3 VI (G80)", subTitle: "2021, 7 000 км"),
                Transport(image: "ferrari", price: "75 000 000 Р", title: "Ferrari SF90 Stradale I", subTitle: "2021")])
        ]
    }
}

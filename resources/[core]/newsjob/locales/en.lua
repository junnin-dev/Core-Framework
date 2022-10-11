local Translations = {
    text = {
        weazle_overlay = "Weazle Overlay ~INPUT_PICKUP~ \nFilm Overlay: ~INPUT_INTERACTION_MENU~",
        weazel_news_vehicles = "Veículos de notícias da WEAZEL",
        close_menu = "⬅ Feche o menu",
        weazel_news_helicopters = "Helicópteros WEAZEL NEWS",
        store_vehicle = "~g~E~w~ - Armazene o veículo",
        vehicles = "~g~E~w~ - Veículos",
        store_helicopters = "~g~E~w~ - Armazene os helicópteros",
        helicopters = "~g~E~w~ - Helicópteros",
        enter = "~g~E~w~ - Digitar",
        go_outside = "~g~E~w~ - Sair",
        breaking_news= "ÚLTIMAS NOTÍCIAS"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

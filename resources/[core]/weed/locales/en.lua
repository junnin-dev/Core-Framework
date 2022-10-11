local Translations = {
    error = {
        process_canceled = "Processo cancelado",
        plant_has_died = "A planta morreu. Press ~r~ E ~w~ para remover a planta.",
        cant_place_here = "Não posso colocar aqui",
        not_safe_here = "Não é seguro aqui, tente sua casa",
        not_need_nutrition = "A planta não precisa de nutrição",
        this_plant_no_longer_exists = "Esta planta não existe mais?",
        house_not_found = "Casa não encontrada",
        you_dont_have_enough_resealable_bags = "Você não tem sacolas vedáveis suficientes",
    },
    text = {
        sort = 'Sort:',
        harvest_plant = 'Press ~g~ E ~w~ para colher planta.',
        nutrition = "Nutrição:",
        health = "Saúde:",
        harvesting_plant = "Planta de colheita",
        planting = "Plantio",
        feeding_plant = "Planta de alimentação",
        the_plant_has_been_harvested = "A planta foi colhida",
        removing_the_plant = "Removendo a planta",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

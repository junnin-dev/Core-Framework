local Translations = {
    error = {
        fingerprints = 'Você deixou uma impressão digital no vidro',
        minimum_police = 'Mínimo de %{value} A polícia precisava',
        wrong_weapon = 'Sua arma não é forte o suficiente ..',
        to_much = 'Você tem muito no seu bolso'
    },
    success = {},
    info = {
        progressbar = 'Esmagando a vitrine',
    },
    general = {
        target_label = 'Esmagar a vitrine',
        drawtextui_grab = '[E] Esmagar a vitrine',
        drawtextui_broken = 'Exibição da estação está quebrada'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

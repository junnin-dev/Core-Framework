local Translations = {
    success = {
        hunger_set = 'Fitbit: Aviso de fome definido como %{hungervalue}%',
        thirst_set = 'Fitbit: Aviso de sede definido como %{thirstvalue}%',
    },
    warning = {
        hunger_warning = 'Sua fome é %{hunger}%',
        thirst_warning = 'Sua sede está %{thirst}%'
    },
    info = {
        fitbit = 'FITBIT '
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

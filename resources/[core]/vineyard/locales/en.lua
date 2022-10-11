local Translations = {
    error = {
        ["invalid_job"] = "Eu não acho que trabalho aqui ...",
        ["invalid_items"] = "Você não tem os itens corretos!",
        ["no_items"] = "Você não tem itens!",
    },
    progress = {
        ["pick_grapes"] = "Escolher uvas ..",
        ["process_grapes"] = "Processando uvas ..",
    },
    task = {
        ["start_task"] = "[E] Para iniciar",
        ["load_ingrediants"] = "[E] Carregar ingredientes",
        ["wine_process"] = "[E] Comece a Wineprocess",
        ["get_wine"] = "[E] Pegue vinho",
        ["make_grape_juice"] = "[E] Faça suco de uva",
        ["countdown"] = "Tempo restante %{time}s",
        ['cancel_task'] = "Você cancelou a tarefa"
    },
    text = {
        ["start_shift"] = "Você começou seu turno no vinha!",
        ["end_shift"] = "Seu turno na vinha terminou!",
        ["valid_zone"] = "Zona válida!",
        ["invalid_zone"] = "Zona inválida!",
        ["zone_entered"] = "%{zone} Zona inserida",
        ["zone_exited"] = "%{zone} Zona saiu",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

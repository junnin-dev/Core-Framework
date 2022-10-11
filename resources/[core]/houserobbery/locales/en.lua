local Translations = {
    error = {
        ["missing_something"] = "Parece que você está perdendo alguma coisa ...",
        ["not_enough_police"] = "Polícia insuficiente ..",
        ["door_open"] = "A porta já está aberta ..",
        ["process_cancelled"] = "Processo cancelado ..",
        ["didnt_work"] = "Não funcionou..",
        ["emty_box"] = "A caixa está vazia ..",
    },
    success = {
        ["worked"] = "Funcionou!",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

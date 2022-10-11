local Translations = {
    error = {
        minimum_store_robbery_police = "Polícia insuficiente (%{MinimumStoreRobberyPolice} Requeridas)",
        not_driver = "Você não é o motorista",
        demolish_vehicle = "Você não tem permissão para demolir veículos agora",
        process_canceled = "Processo cancelado ..",
        you_broke_the_lock_pick = "Você quebrou a escolha da bloqueio",
        safe_code = "Código seguro: "
    },
    text = {
        the_cash_register_is_empty = "A caixa registradora está vazia",
        try_combination = "~g~E~w~ - Experimente a combinação",
        safe_opened = "Seguro aberto",
        emptying_the_register= "Esvaziando o registro .."
    },
    email = {
        shop_robbery = "10-31 | Assalto à loja",
        someone_is_trying_to_rob_a_store = "Alguém está tentando roubar uma loja em %{street} (CAMERA ID: %{cameraId1})",
        storerobbery_progress = "Storerobbery em andamento"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

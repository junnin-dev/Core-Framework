local Translations = {
    error = {
        ["canceled"] = "Cancelado",
        ["911_chatmessage"] = "911 MENSAGEM",
        ["take_off"] = "/roupa de mergulho para tirar a roupa de mergulho",
        ["not_wearing"] = "Você não está usando um equipamento de mergulho ..",
        ["no_coral"] = "Você não tem nenhum coral para vender..",
        ["not_standing_up"] = "Você precisa estar de pé para colocar o equipamento de mergulho",
    },
    success = {
        ["took_out"] = "Você tirou sua roupa de mergulho",
    },
    info = {
        ["collecting_coral"] = "Coletando coral",
        ["diving_area"] = "Área de mergulho",
        ["collect_coral"] = "Collect coral",
        ["collect_coral_dt"] = "[E] - Colete coral",
        ["checking_pockets"] = "Verificando bolsos para vender coral",
        ["sell_coral"] = "Vender Coral",
        ["sell_coral_dt"] = "[E] - Vender Coral",
        ["blip_text"] = "911 - Local de mergulho",
        ["put_suit"] = "Coloque um traje de mergulho",
        ["pullout_suit"] = "Pegue um traje de mergulho ..",
        ["cop_msg"] = "Este coral pode ser roubado",
        ["cop_title"] = "Mergulho ilegal",
        ["command_diving"] = "Tire seu traje de mergulho",
    },
    warning = {
        ["oxygen_one_minute"] = "Você tem menos de 1 minuto de ar restante",
        ["oxygen_running_out"] = "Seu equipamento de mergulho está ficando sem ar",
    },
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
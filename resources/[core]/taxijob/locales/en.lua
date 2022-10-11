local Translations = {
    error = {
        ["already_mission"] = "Você já está fazendo uma missão NPC",
        ["not_in_taxi"] = "Você não está em um táxi",
        ["missing_meter"] = "Este veículo não tem medidor de táxi",
        ["no_vehicle"] = "Você não está em um veículo",
        ["not_active_meter"] = "O medidor de táxi não está ativo",
        ["no_meter_sight"] = "Sem medidor de táxi à vista",
    },
    success = {},
    info = {
        ["person_was_dropped_off"] = "A pessoa foi deixada!",
        ["npc_on_gps"] = "O NPC é indicado em seu GPS",
        ["go_to_location"] = "Traga o NPC para o local especificado",
        ["vehicle_parking"] = "[E] Estacionamento do veículo",
        ["job_vehicles"] = "[E] Veículos de trabalho",
        ["drop_off_npc"] = "[E] Deixe o NPC",
        ["call_npc"] = "[E] Ligue para NPC",
        ["blip_name"] = "CAB CANTENDO",
        ["taxi_label_1"] = "CAB padrão",
        ["no_spawn_point"] = "Incapaz de encontrar um local para trazer o táxi",
        ["taxi_returned"] = "Cab estacionado"
    },
    menu = {
        ["taxi_menu_header"] = "Veículos de táxi",
        ["close_menu"] = "⬅ Feche o menu",
        ['boss_menu'] = "Menu do chefe"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

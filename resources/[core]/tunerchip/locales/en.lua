local Translations = {
    success = {
        this_vehicle_has_been_tuned = "Este veículo foi ajustado",
    },
    text = {
        this_is_not_the_idea_is_it = "Esta não é a ideia, é?",
        connecting_nos = "Conectando nos...",
    },
    error = {
        tunerchip_vehicle_tuned = "Tunerchip v1.05: Veículo sintonizado!",
        this_vehicle_has_not_been_tuned = "Este veículo não foi ajustado",
        no_vehicle_nearby = "Nenhum veículo próximo",
        tunerchip_vehicle_has_been_reset = "TunerChip v1.05: O veículo foi redefinido!",
        you_are_not_in_a_vehicle = "Você não está em um veículo",
        you_cannot_do_that_from_this_seat = "Você não pode fazer isso neste assento!",
        you_already_have_nos_active = "Você já tem o NOS Active",
        canceled = "Cancelada",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

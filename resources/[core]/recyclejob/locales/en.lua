local Translations = {
    success = {
        you_have_been_clocked_in = "Você foi relatado em",
    },
    text = {
        point_enter_warehouse = "[E] Entre no armazém",
        enter_warehouse= "Entre no armazém",
        exit_warehouse= "Saída do armazém",
        point_exit_warehouse = "[E] Saída do armazém",
        clock_out = "[E] Relógio",
        clock_in = "[E] Relógio em",
        hand_in_package = "Mão no pacote",
        point_hand_in_package = "[E] Mão no pacote",
        get_package = "Obtenha o pacote",
        point_get_package = "[E] Obtenha o pacote",
        picking_up_the_package = "Pegando o pacote",
        unpacking_the_package = "Desembalando o pacote",
    },
    error = {
        you_have_clocked_out = "Você tem um tempo"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
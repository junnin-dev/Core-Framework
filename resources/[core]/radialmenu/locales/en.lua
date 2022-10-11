local Translations = {
    error = {
        no_people_nearby = "Nenhum jogador por perto",
        no_vehicle_found = "Nenhum veículo encontrado",
        extra_deactivated = "Extra %{extra} foi desativado",
        extra_not_present = "Extra %{extra} não está presente neste veículo",
        not_driver = "Você não é o motorista do veículo",
        vehicle_driving_fast = "Este veículo está indo muito rápido",
        seat_occupied = "Este assento está ocupado",
        race_harness_on = "Você tem um cinto de corrida, você não pode trocar",
        obj_not_found = "Não foi possível criar o objeto solicitado",
        not_near_ambulance = "Você não está perto de uma ambulância",
        far_away = "Você está muito longe",
        stretcher_in_use = "Esta maca já está em uso",
        not_kidnapped = "Você não sequestrou essa pessoa",
        trunk_closed = "O porta-malas está fechado",
        cant_enter_trunk = "Você não pode entrar neste baú",
        already_in_trunk = "Você já está no porta-malas",
        someone_in_trunk = "Alguém já está no porta-malas"
    },
    progress = {
        flipping_car = "Veículo capotando.."
    },
    success = {
        extra_activated = "Extra %{extra} Foi ativado",
        entered_trunk = "Você está no porta-malas"
    },
    info = {
        no_variants = "Não parece haver quaisquer variantes para isso",
        wrong_ped = "Este modelo de ped não permite esta opção",
        nothing_to_remove = "Parece que você não tem nada para remover",
        already_wearing = "Você já está vestindo isso",
        switched_seats = "Você está agora no %{seat}"
    },
    general = {
        command_description = "Abrir Menu Radial",
        push_stretcher_button = "~g~E~w~ - Empurrar Maca",
        stop_pushing_stretcher_button = "~g~E~w~ - Parar de empurrar",
        lay_stretcher_button = "~g~G~w~ - Deitar na maca",
        push_position_drawtext = "Empurre aqui",
        get_off_stretcher_button = "~g~G~w~ - Sair da maca",
        get_out_trunk_button = "[~g~E~w~] Saia do tronco",
        close_trunk_button = "[~g~G~w~] Feche o tronco",
        open_trunk_button = "[~g~G~w~] Abra o porta-malas",
        getintrunk_command_desc = "Entre no tronco",
        putintrunk_command_desc = "Colocar jogador no tronco"
    },
    options = {
        emergency_button = "Botão de emergência",
        driver_seat = "Banco do motorista",
        passenger_seat = "Assento do passageiro",
        other_seats = "Outro assento",
        rear_left_seat = "Banco traseiro esquerdo",
        rear_right_seat = "Banco traseiro direito"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

local Translations = {
    error = {
        finish_work = "Termine todo o seu trabalho primeiro",
        vehicle_not_correct = "Este não é o veículo certo",
        failed = "Você falhou",
        not_towing_vehicle = "Você deve estar em seu veículo de reboque",
        too_far_away = "Você está muito longe",
        no_work_done = "Você ainda não fez nenhum trabalho",
        no_deposit = "$%{value} Deposito requerido",
    },
    success = {
        paid_with_cash = "$%{value} Depósito pago com dinheiro",
        paid_with_bank = "$%{value} Depósito pago do banco",
        refund_to_cash = "$%{value} Depósito pago com dinheiro",
        you_earned = "Você ganhou $%{value}",
    },
    menu = {
        header = "Caminhões disponíveis",
        close_menu = "⬅ Feche o menu",
    },
    mission = {
        delivered_vehicle = "Você entregou um veículo",
        get_new_vehicle = "Um veículo novo pode ser recolhido",
        towing_vehicle = "Içar o veículo ...",
        goto_depot = "Leve o veículo para o Hayes Depot",
        vehicle_towed = "Veículo rebocado",
        untowing_vehicle = "Remova o veículo",
        vehicle_takenoff = "Veículo retirado",
    },
    info = {
        tow = "Coloque um carro na parte de trás da sua mesa",
        toggle_npc = "Alternar o trabalho NPC",
        skick = "Tentativa de explorar o abuso",
    },
    label = {
        payslip = "payslip",
        vehicle = "Veículo",
        npcz = "Npczone",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

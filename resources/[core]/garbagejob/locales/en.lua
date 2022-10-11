local Translations = {
    error = {
        ["cancled"] = "Cancelada",
        ["no_truck"] = "Você não tem caminhão!",
        ["not_enough"] = "Dinheiro insuficiente (%{value} requeridas)",
        ["too_far"] = "Você está muito longe do ponto de entrega",
        ["early_finish"] = "Devido ao acabamento antecipado (concluído: %{completed} total: %{total}), Seu depósito não será devolvido.",
        ["never_clocked_on"] = "Você nunca passou!",
        ["all_occupied"] = "Todos os pontos de estacionamento estão ocupados",
    },
    success = {
        ["clear_routes"] = "Rotas de usuários limpos que eles tinham %{value} rotas armazenadas",
        ["pay_slip"] = "Você tem $%{total},Seu Payslip %{deposit} foi pago em sua conta bancária!",
    },
    target = {
        ["talk"] = 'Fale com Garbageman',
        ["grab_garbage"] = "Pegue saco de lixo",
        ["dispose_garbage"] = "Descarte saco de lixo",
    },
    menu = {
        ["header"] = "Menu principal do lixo",
        ["collect"] = "Colete o salário",
        ["return_collect"] = "Retorne o caminhão e colete salário aqui!",
        ["route"] = "Rota de solicitação",
        ["request_route"] = "Solicite uma rota de lixo",
    },
    info = {
        ["payslip_collect"] = "[E] - payslip",
        ["payslip"] = "payslip",
        ["not_enough"] = "Você não tem dinheiro suficiente para o depósito. Os custos de depósito são $%{value}",
        ["deposit_paid"] = "Você pagou $%{value} depósito!",
        ["no_deposit"] = "Você não tem depósito pago neste veículo ..",
        ["truck_returned"] = "Truck voltou, colete seu Payslip para receber seu pagamento e depósito de volta!",
        ["bags_left"] = "Ainda há %{value} Sacos restantes!",
        ["bags_still"] = "Ainda há %{value} bolsa ali!",
        ["all_bags"] = "Todos os sacos de lixo estão concluídos, prossiga para o próximo local!",
        ["depot_issue"] = "Houve um problema no depósito, por favor retorne imediatamente!",
        ["done_working"] = "Você terminou de trabalhar!Volte para o depósito.",
        ["started"] = "Você começou a trabalhar, localização marcada no GPS!",
        ["grab_garbage"] = "[E] Pegue um saco de lixo",
        ["stand_grab_garbage"] = "Fique aqui para pegar um saco de lixo.",
        ["dispose_garbage"] = "[E] Descarte de saco de lixo",
        ["progressbar"] = "Colocando bolsa no Trashmaster ..",
        ["garbage_in_truck"] = "Coloque a bolsa em seu caminhão ..",
        ["stand_here"] = "Fique aqui ..",
        ["found_crypto"] = "Você encontrou um criptotick no chão",
        ["payout_deposit"] = "(+ $%{value} depósito)",
        ["store_truck"] =  "[E] - Armazene o caminhão de lixo",
        ["get_truck"] =  "[E] - Caminhão de lixo",
        ["picking_bag"] = "Pegando saco de lixo ..",
        ["talk"] = "[E] Fale com o lixo",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

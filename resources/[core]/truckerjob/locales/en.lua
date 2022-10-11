local Translations = {
    error = {
        no_deposit = "$%{value} Deposito requerido",
        cancelled = "Cancelada",
        vehicle_not_correct = "Este não é um veículo comercial!",
        no_driver = "Você deve ser o motorista para fazer isso ..",
        no_work_done = "Você ainda não fez nenhum trabalho ..",
        backdoors_not_open = "Os backdoors do veículo não estão abertos",
        get_out_vehicle = "Você precisa sair do veículo para executar esta ação",
        too_far_from_trunk = "Você precisa pegar as caixas do porta -malas do seu veículo",
        too_far_from_delivery = "Você precisa estar mais perto do ponto de entrega"
    },
    success = {
        paid_with_cash = "$%{value} Depósito pago com dinheiro",
        paid_with_bank = "$%{value} Depósito pago do banco",
        refund_to_cash = "$%{value} Depósito pago com dinheiro",
        you_earned = "Você ganhou $%{value}",
        payslip_time = "Você foi a todas as lojas .. Hora do seu Payslip!",
    },
    menu = {
        header = "Caminhões disponíveis",
        close_menu = "⬅ Feche o menu",
    },
    mission = {
        store_reached = "A loja chegou, obtenha uma caixa no porta -malas com [E] e entregue ao marcador",
        take_box = "Pegue uma caixa de produtos",
        deliver_box = "Entregue caixa de produtos",
        another_box = "Obtenha outra caixa de produtos",
        goto_next_point = "Você entregou todos os produtos, para o próximo ponto",
        return_to_station = "Você entregou todos os produtos, retorne à estação",
        job_completed = "Você concluiu sua rota, por favor, colete seu cheque de pagamento"
    },
    info = {
        deliver_e = "~g~E~w~ - Entregar produtos",
        deliver = "Entregar produtos",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

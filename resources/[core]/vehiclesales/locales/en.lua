local Translations = {
    error = {
        not_your_vehicle = 'Este não é o seu veículo..',
        vehicle_does_not_exist = 'Veículo não existe',
        not_enough_money = 'Você não tem dinheiro suficiente',
        finish_payments = 'Você deve terminar de pagar este veículo, antes de poder vendê-lo.',
        no_space_on_lot = 'Não há espaço para o seu carro no lote!'
    },
    success = {
        sold_car_for_price = 'Você vendeu seu carro por $%{value}',
        car_up_for_sale = 'Seu carro foi colocado à venda! Preço - $%{value}',
        vehicle_bought = 'Veículo comprado'
    },
    info = {
        confirm_cancel = '~g~Y~w~ - confirme / ~r~N~w~ - Cancelar ~g~',
        vehicle_returned = 'Seu veículo foi devolvido',
        used_vehicle_lot = 'Lote de carros usados',
        sell_vehicle_to_dealer = '[~g~E~w~] - Vender veículo para revendedor para ~g~$%{value}',
        view_contract = '[~g~E~w~] - Ver Contrato do Veículo',
        cancel_sale = '[~r~G~w~] - Cancelar venda de veículo',
        model_price = '%{value}, Preço: ~g~$%{value2}',
        are_you_sure = 'Tem certeza de que não quer mais vender seu veículo?',
        yes_no = '[~g~7~w~] - Sim | [~r~8~w~] - No',
        place_vehicle_for_sale = '[~g~E~w~] - Colocar Veículo à Venda Pelo Proprietário'
    },
    charinfo = {
        firstname = 'não',
        lastname = 'conhecido',
        account = 'Conta não conhecida..',
        phone = 'número de telefone desconhecido..'
    },
    mail = {
        sender = 'Vendas de trailers Larrys',
        subject = 'Você vendeu um veículo!',
        message = 'Você fez $%{value} da venda do seu %{value2}.'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

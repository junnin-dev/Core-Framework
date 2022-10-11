local Translations = {
    error = {
        no_money = 'Dinheiro insuficiente',
        too_far = 'Você está muito longe do seu suporte de cachorro -quente',
        no_stand = 'Você não tem um suporte de cachorro -quente',
        cust_refused = 'O cliente recusou!',
        no_stand_found = 'Seu suporte de cachorro -quente não estava em lugar algum para ser visto, você não receberá seu depósito de volta!',
        no_more = 'Você não tem %{value} mais sobre isso na frente do conselho',
        deposit_notreturned = 'Você não tinha um suporte de cachorro -quente',
        no_dogs = 'Você não tem nenhum cachorro -quente',
    },
    success = {
        deposit = 'Você pagou a $%{depositdepósitoit!',
        deposit_returned = 'Sua $%{deposit} O depósito foi devolvido!',
        sold_hotdogs = '%{value} x Hotdog(\'s) Vendido por $%{value2}',
        made_hotdog = 'Você fez um %{value} Cachorros quentes',
        made_luck_hotdog = 'Você fez %{value} x %{value2} Cachorros quentes',
    },
    info = {
        command = "Excluir suporte (somente administrador)",
        blip_name = 'Barraca de cachorro quente',
        start_working = '[E] Comece a trabalhar',
        start_work = 'Comece a trabalhar',
        stop_working = '[E] Parar de trabalhar',
        stop_work = 'Parar de trabalhar',
        grab_stall = '[~g~G~s~] Pegue a barraca',
        drop_stall = '[~g~G~s~] Libere a barraca',
        grab = 'Pegue a barraca',
        prepare = 'Prepare o cachorro -quente',
        toggle_sell = 'Alternar a venda',
        selling_prep = '[~g~E~s~] Hotdog Prepare [Sale: ~g~Selling~w~]',
        not_selling = '[~g~E~s~] Hotdog Prepare [Sale: ~r~Not Selling~w~]',
        sell_dogs = '[~g~7~s~] Vender %{value} x Cachorros quentes for $%{value2} / [~g~8~s~] Reject',
        sell_dogs_target = 'Vender %{value} x Cachorros quentes for $%{value2}',
        admin_removed = "Stand de cachorro -quente removido",
        label_a = "Perfeito (a)",
        label_b = "Raro (b)",
        label_c = "Comum (C)"
    },
        keymapping = {
        gkey = 'Deixe de lado o HotDog Stand',
        
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

local Translations = {
    error = {
        negative = 'Tentando vender uma quantia negativa?',
        no_melt = 'Você não me deu nada para derreter...',
        no_items = 'Não há itens suficientes',
    },
    success = {
        sold = 'Você vendeu %{value} x %{value2} por $%{value3}',
        items_received = 'Você recebeu %{value} x %{value2}',
    },
    info = {
        title = 'Loja de penhores',
        subject = 'Itens de derretimento',
        message = 'Terminamos de derreter seus itens. Você pode vir buscá-los a qualquer momento.',
        open_pawn = 'Abra a loja de penhores',
        sell = 'Vender itens',
        sell_pawn = 'Vender itens para a loja de penhores',
        melt = 'Itens derreter',
        melt_pawn = 'Abra a oficina de fusão',
        melt_pickup = 'Coletar itens derretidos',
        pawn_closed = 'A casa de penhores está fechada. Volte entre %{value}:00 AM - %{value2}:00 PM',
        sell_items = 'Preço de venda $%{value}',
        back = '⬅ Volte',
        melt_item = 'Derretido %{value}',
        max = 'Valor máximo %{value}',
        submit = 'Derretido',
        melt_wait = 'Me dê %{value} minutos e Eu vou ter suas coisas derretidas',
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
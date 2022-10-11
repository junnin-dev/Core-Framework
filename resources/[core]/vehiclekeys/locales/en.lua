local Translations = {
    notify = {
        ydhk = 'Você não tem as chaves deste veículo.',
        nonear = 'Não há ninguém por perto para entregar as chaves para',
        vlock = 'Veículo trancado!',
        vunlock = 'Veículo desbloqueado!',
        vlockpick = 'Você conseguiu arrombar a fechadura da porta!',
        fvlockpick = 'Você não consegue encontrar as chaves e fica frustrado.',
        vgkeys = 'Você entrega as chaves.',
        vgetkeys = 'Você recebeu as chaves do veículo!',
        fpid = 'Preencha os argumentos de ID do jogador e Placa',
    },
    progress = {
        takekeys = 'Tirando as chaves do corpo...',
        hskeys = 'Procurando as chaves do carro...',
        acjack = 'Tentativa de roubo de carro...',
    },
    info = {
        skeys = '~g~[H]~w~ - Pesquisar chaves',
        tlock = 'Alternar bloqueios de veículos',
        palert = 'Roubo de veículo em andamento. Modelo: ',
    },
    addcom = {
        engine = 'Alternar mecanismo',
        givekeys = 'Entregar as chaves a alguém. Se não houver identificação, entrega à pessoa mais próxima ou a todos no veículo.',
        givekeys_id = 'id',
        givekeys_id_help = 'ID do jogador',
        addkeys = 'Adiciona chaves a um veículo para alguém.',
        addkeys_id = 'id',
        addkeys_id_help = 'ID do jogador',
        addkeys_plate = 'plate',
        addkeys_plate_help = 'Plate',
        rkeys = 'Remova as chaves de um veículo para alguém.',
        rkeys_id = 'id',
        rkeys_id_help = 'ID do jogador',
        rkeys_plate = 'plate',
        rkeys_plate_help = 'Plate',
    }

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

local Translations = {
    error = {
        to_far_from_door = 'Você está muito longe da campainha',
        nobody_home = 'Não tem ninguém em casa..',
        nobody_at_door = 'Não há ninguém na porta...'
    },
    success = {
        receive_apart = 'Você tem um apartamento',
        changed_apart = 'Você mudou de apartamento',
    },
    info = {
        at_the_door = 'Alguém está na porta!',
    },
    text = {
        options = '[E] Opções de apartamentos',
        enter = 'Entrar Apartamento',
        ring_doorbell = 'Campainha de toque',
        logout = 'Caractere de logout',
        change_outfit = 'Mudar roupa',
        open_stash = 'Abrir Baú',
        move_here = 'Mover aqui',
        open_door = 'Porta aberta',
        leave = 'Sair do apartamento',
        close_menu = '⬅ Fechar Menu',
        tennants = 'Inquilinos',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

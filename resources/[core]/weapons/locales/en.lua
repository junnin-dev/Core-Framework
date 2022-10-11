local Translations = {
    error = {
        canceled = 'Cancelado',
        max_ammo = 'Capacidade máxima de munição',
        no_weapon = 'Você não tem arma.',
        no_support_attachment = 'Esta arma não suporta este anexo.',
        no_weapon_in_hand = 'Você não tem uma arma na mão.',
        weapon_broken = 'Esta arma está quebrada e não pode ser usada.',
        no_damage_on_weapon = 'Esta arma não está danificada..',
        weapon_broken_need_repair = 'Sua arma está quebrada, você precisa repará-la antes de poder usá-la novamente.',
        attachment_already_on_weapon = 'Você já tem um %{value} em sua arma.'
    },
    success = {
        reloaded = 'Recarregado'
    },
    info = {
        loading_bullets = 'Carregando marcadores',
        repairshop_not_usable = 'A oficina neste momento é ~r~NOT~w~ utilizável.',
        weapon_will_repair = 'Sua arma será consertada.',
        take_weapon_back = '[E] - Pegue a arma de volta',
        repair_weapon_price = '[E] Consertar Arma, ~g~$%{value}~w~',
        removed_attachment = 'Você removeu %{value} da sua arma!',
        hp_of_weapon = 'Durabilidade da sua arma'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Repair',
        message = 'Seu %{value} está consertado vc pode retirar no local. <br><br> Paz para fora madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

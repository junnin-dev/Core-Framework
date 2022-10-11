local Translations = {
    labels = {
        engine = 'Motor',
        bodsy = 'Body',
        radiator = 'Radiator',
        axle = 'Drive Shaft',
        brakes = 'Brakes',
        clutch = 'Clutch',
        fuel = 'Fuel tank',
        sign_in = 'Entrar',
        sign_off = 'Sign Off',
        o_stash = '[E] Abrir Stash',
        h_vehicle = '[E] Ocultar o veículo',
        g_vehicle = '[E] Obtenha veículo',
        o_menu = '[E] Abrir Menu',
        work_v = '[E] Trabalhar em veículo',
        progress_bar = 'Reparando...',
        veh_status = 'Status do veículo:',
        job_blip = 'Treinadores mecânicos',
    },

    lift_menu = {
        header_menu = 'Opções do veículo',
        header_vehdc = 'Desconecte o veículo',
        desc_vehdc = 'Veículo Untatch em elevador',
        header_stats = 'Verifique o status',
        desc_stats = 'Verifique o status do veículo',
        header_parts = 'Peças do veículo',
        desc_parts = 'Reparar peças de veículos',
        c_menu = '⬅ Feche o menu'
    },

    parts_menu = {
        status = 'status: ',
        menu_header = 'Menu de peça',
        repair_op = 'Reparar:',
        b_menu = '⬅ Menu anterior',
        d_menu = 'Voltar ao menu de peças',
        c_menu = '⬅ Feche o menu'
    },

    nodamage_menu = {
        header = 'Sem dano',
        bh_menu = 'Menu anterior',
        bd_menu = 'Não há danos a esta parte!',
        c_menu = '⬅ Feche o menu'
    },

    notifications = {
        not_enough = 'Você não tem o suficiente',
        not_have = 'Você não tem',
        not_materials = 'Não há materiais suficientes no cofre',
        rep_canceled = 'Reparo cancelado',
        repaired = 'foi reparado!',
        uknown = 'status desconhecido',
        not_valid = 'Veículo não válido',
        not_close = 'Você não está perto o suficiente do veículo',
        veh_first = 'Você deve estar no veículo primeiro',
        outside = 'Você deve estar fora do veículo',
        wrong_seat = 'Você não é o motorista ou em uma bicicleta',
        not_vehicle = 'Você não está em um veículo',
        progress_bar = 'Reparando Veiculo..',
        process_canceled = 'Processo cancelado',
        not_part = 'Não é uma parte válida',
        partrep ='o %{value} É reparado!',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
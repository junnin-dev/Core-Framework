local Translations = {
    error = {
        not_online = 'Jogador não online',
        wrong_format = 'Formato incorreto',
        missing_args = 'Nem todo argumento foi inserido (x, y, z)',
        missing_args2 = 'Todos os argumentos devem ser preenchidos!',
        no_access = 'Sem acesso a este comando',
        company_too_poor = 'Seu empregador está quebrado',
        item_not_exist = 'O item não existe',
        too_heavy = 'Inventário muito cheio',
        location_not_exist = 'Localização não existe',
        duplicate_license = 'Licença duplicada de rockstar encontrada',
        no_valid_license  = 'Nenhuma licença rockstar válida encontrada',
        not_whitelisted = 'Você não está em branco para este servidor',
        server_already_open = 'O servidor já está aberto',
        server_already_closed = 'O servidor já está fechado',
        no_permission = 'Você não tem permissões para isso ..',
        no_waypoint = 'Sem waypoint definido.',
        tp_error = 'Erro ao se teletransportar.',
    },
    success = {
        server_opened = 'O servidor foi aberto',
        server_closed = 'O servidor foi fechado',
        teleported_waypoint = 'Teletransportado para o waypoint.',
    },
    info = {
        received_paycheck = 'Você recebeu seu salário de $%{value}',
        job_info = 'Trabalho: %{value} | Avaliar: %{value2} | Dever: %{value3}',
        gang_info = 'Gangue: %{value} | Avaliar: %{value2}',
        on_duty = 'Você está de plantão agora!',
        off_duty = 'Você está agora de folga!',
        checking_ban = 'Olá %s. Estamos verificando se você for banido.',
        join_server = 'Bem-vindo %s para {Server Name}.',
        checking_whitelisted = 'Olá %s. Estamos verificando seu subsídio.',
        exploit_banned = 'Você foi banido por trapaça.Verifique nossa discórdia para obter mais informações: %{discord}',
        exploit_dropped = 'Você foi chutado para exploração',
    },
    command = {
        tp = {
            help = 'TP To Player or Coords (Admin Only)',
            params = {
                x = { name = 'id/x', help = 'ID of player or X position'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'TP To Marker (Admin Only)' },
        togglepvp = { help = 'Toggle PVP on the server (Admin Only)' },
        addpermission = {
            help = 'Give Player Permissions (God Only)',
            params = {
                id = { name = 'id', help = 'ID of player' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        removepermission = {
            help = 'Remove Player Permissions (God Only)',
            params = {
                id = { name = 'id', help = 'ID of player' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        openserver = { help = 'Open the server for everyone (Admin Only)' },
        closeserver = {
            help = 'Close the server for people without permissions (Admin Only)',
            params = {
                reason = { name = 'reason', help = 'Reason for closing (optional)' },
            },
        },
        car = {
            help = 'Spawn Vehicle (Admin Only)',
            params = {
                model = { name = 'model', help = 'Model name of the vehicle' },
            },
        },
        dv = { help = 'Delete Vehicle (Admin Only)' },
        givemoney = {
            help = 'Give A Player Money (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        setmoney = {
            help = 'Set Players Money Amount (Admin Only)',
            params = {
                id = { name = 'id', help = 'Player ID' },
                moneytype = { name = 'moneytype', help = 'Type of money (cash, bank, crypto)' },
                amount = { name = 'amount', help = 'Amount of money' },
            },
        },
        job = { help = 'Verifique seu trabalho' },
        setjob = {
            help = 'Defina um trabalho de jogadores (somente administrador)',
            params = {
                id = { name = 'id', help = 'ID do jogador' },
                job = { name = 'job', help = 'Nome do trabalho' },
                grade = { name = 'grade', help = 'Nota de trabalho' },
            },
        },
        gang = { help = 'Verifique sua gangue' },
        setgang = {
            help = 'Set A Players Gang (Admin Only)',
            params = {
                id = { name = 'id', help = 'ID do jogador' },
                gang = { name = 'gang', help = 'Nome de gangue' },
                grade = { name = 'grade', help = 'Grau de gangue' },
            },
        },
        ooc = { help = 'Mensagem de bate -papo OOC' },
        me = {
            help = 'Mostrar mensagem local',
            params = {
                message = { name = 'message', help = 'Mensagem para enviar' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

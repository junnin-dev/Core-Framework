local Translations = {
    error = {
        lockpick_fail = "Falhou",
        door_not_found = "Não recebeu um hash de modelo, se a porta for transparente, certifique-se de apontar para a moldura da porta",
        same_entity = "Ambas as portas não podem ser a mesma entidade",
        door_registered = "Esta porta já está registrada",
        door_identifier_exists = "Já existe uma porta com este identificador na configuração. (%s)",
    },
    success = {
        lockpick_success = "Sucesso"
    },
    general = {
        locked = "Bloqueado",
        unlocked = "Desbloqueado",
        locked_button = "[E] - Bloqueado",
        unlocked_button = "[E] - Desbloqueado",
        keymapping_description = "Interagir com fechaduras de portas",
        keymapping_remotetriggerdoor = "Acionamento remoto de uma porta",
        locked_menu = "Bloqueado",
        pickable_menu = "Lockpicable",
        cantunlock_menu = 'Não consigo desbloquear',
        hidelabel_menu = 'Ocultar etiqueta da porta',
        distance_menu = "Distância máxima",
        item_authorisation_menu = "Autoria do item",
        citizenid_authorisation_menu = "Autorização de Cidadão",
        gang_authorisation_menu = "Autorização de gangue",
        job_authorisation_menu = "Autorização de trabalho",
        doortype_title = "Tipo de porta",
        doortype_door = "Porta Única",
        doortype_double = "Porta dupla",
        doortype_sliding = "Porta de correr simples",
        doortype_doublesliding = "Porta deslizante dupla",
        doortype_garage = "Garagem",
        dooridentifier_title = "Identificador único",
        doorlabel_title = "Por etiqueta",
        configfile_title = "Nome do arquivo de configuração",
        submit_text = "Enviar",
        newdoor_menu_title = "Adicionar uma nova porta",
        newdoor_command_description = "Adicionar uma nova porta ao sistema de fechadura",
        doordebug_command_description = "Alternar o modo de depuração",
        warning = "Aviso",
        created_by = "criado por",
        warn_no_permission_newdoor = "%{player} (%{license}) tentou adicionar uma nova porta sem permissão (source: %{source})",
        warn_no_authorisation = "%{player} (%{license}) tentou abrir uma porta sem autorização (Sent: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}) tentou atualizar a porta inválida (Sent: %{doorID})",
        warn_wrong_state = "%{player} (%{license}) tentou atualizar para um estado inválido (Sent: %{state})",
        warn_wrong_doorid_type = "%{player} (%{license}) não enviou um doorID apropriado (Sent: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}) abriu uma porta usando privilégios de administrador"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
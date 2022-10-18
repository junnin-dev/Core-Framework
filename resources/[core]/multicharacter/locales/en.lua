local Translations = {
    notifications = {
        ["char_deleted"] = "Personagem excluído!",
        ["deleted_other_char"] = "Você excluiu com sucesso o personagem com cidadão %{citizenid}.",
        ["forgot_citizenid"] = "Você esqueceu de inserir um ID do cidadão!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Exclui outro personagem de jogadores",
        ["citizenid"] = "Identificação do cidadão",
        ["citizenid_help"] = "O cidadão da identificação do personagem que você deseja excluir",

        -- /logout
        ["logout_description"] = "Logout do personagem (somente admin)",

        -- /closeNUI
        ["closeNUI_description"] = "Fechar multi nui"
    },

    misc = {
        ["droppedplayer"] = "Você desconectou do núcleo"
    },

    ui = {
        -- Principal
        characters_header = "Meus personagens",
        emptyslot = "Slot vazio",
        play_button = "Play",
        create_button = "Criar personagem",
        delete_button = "Excluir Personagem",

        -- Character Information
        charinfo_header = "Informações sobre o personagem",
        charinfo_description = "Selecione um slot de personagem para ver todas as informações sobre seu personagem.",
        name = "Nome",
        male = "Homen",
        female = "Mulher",
        firstname = "Primeiro Nome ",
        lastname = "Segundo Nome",
        nationality = "Nacionalidade",
        gender = "Gênero",
        birthdate = "Data de nascimento",
        job = "Trabalho",
        jobgrade = "Nota de trabalho",
        cash = "Dinheiro",
        bank = "Banco",
        phonenumber = "Número de telefone",
        accountnumber = "Número da conta",

        chardel_header = "Registro de personagens",

        -- Excluir caráter
        deletechar_header = "Excluir caráter",
        deletechar_description = "Tem certeza de que deseja excluir seu personagem?",

        -- Botões
        cancel = "Cancelar",
        confirm = "confirme",

        -- Carregando texto
        retrieving_playerdata = "Recuperar dados do jogador",
        validating_playerdata = "Validando os dados do jogador",
        retrieving_characters = "Recuperando personagens",
        validating_characters = "Validando caracteres",

        -- Notificações
        ran_into_issue = "Nós encontramos um problema",
        profanity = "Parece que você está tentando usar algum tipo de palavrões / palavras ruins em seu nome ou nacionalidade!",
        forgotten_field = "Parece que você esqueceu de inserir um ou vários campos!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

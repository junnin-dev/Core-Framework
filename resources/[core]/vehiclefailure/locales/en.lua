local Translations = {
    error = {
        ["failed_notification"] = "Failed!",
        ["not_near_veh"] = "Você não está perto de um veículo!",
        ["out_range_veh"] = "Você está muito longe do veículo!",
        ["inside_veh"] = "Você não pode reparar um motor de veículo por dentro!",
        ["healthy_veh"] = "O veículo está muito saudável e precisa de ferramentas melhores!",
        ["inside_veh_req"] = "Você deve estar em um veículo para repará-lo!",
        ["roadside_avail"] = "Há assistência em viagem disponível, ligue para o seu telefone!",
        ["no_permission"] = "Você não tem permissão para reparar veículos",
        ["fix_message"] = "%{message}, e agora vá para uma garagem!",
        ["veh_damaged"] = "Seu veículo está muito danificado!",
        ["nofix_message_1"] = "Você olhou para o seu nível de óleo, e isso parecia normal",
        ["nofix_message_2"] = "Você olhou para sua moto, e nada parece errado",
        ["nofix_message_3"] = "Você olhou para a fita de pato em sua mangueira de óleo e parecia bem",
        ["nofix_message_4"] = "Você ligou o rádio. O barulho estranho do motor agora se foi",
        ["nofix_message_5"] = "O removedor de ferrugem que você usou não teve efeito",
        ["nofix_message_6"] = "Nunca tente fazer algo que não esteja quebrado, mas você não escutou",
    },
    success = {
        ["cleaned_veh"] = "Veículo limpo!",
        ["repaired_veh"] = "Veículo reparado!",
        ["fix_message_1"] = "Você verificou o nível de óleo",
        ["fix_message_2"] = "Você fechou o derramamento de óleo com goma de mascar",
        ["fix_message_3"] = "Você fez a mangueira de óleo com fita",
        ["fix_message_4"] = "Você parou temporariamente o vazamento de óleo",
        ["fix_message_5"] = "Você chutou a moto e ela funciona novamente",
        ["fix_message_6"] = "Você removeu um pouco de ferrugem",
        ["fix_message_7"] = "Você gritou com seu carro, e ele voltou a funcionar",
    },
    progress = {
        ["clean_veh"] = "Limpando o carro...",
        ["repair_veh"] = "Reparando veículo..",

    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
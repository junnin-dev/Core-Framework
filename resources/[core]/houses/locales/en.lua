local Translations = {
    error = {
        ["no_keys"] = "Você não tem as chaves da casa...",
        ["not_in_house"] = "Você não está em uma casa!",
        ["out_range"] = "Você saiu do alcance",
        ["no_key_holders"] = "Nenhum porta-chaves encontrado..",
        ["invalid_tier"] = "Camada da casa inválida",
        ["no_house"] = "Não há casa perto de você",
        ["no_door"] = "Você não está perto o suficiente da porta..",
        ["locked"] = "A casa está trancada!",
        ["no_one_near"] = "Ninguém por perto!",
        ["not_owner"] = "Você não é dono desta casa.",
        ["no_police"] = "Não há força policial presente..",
        ["already_open"] = "Esta casa já está aberta..",
        ["failed_invasion"] = "falhou tente novamente",
        ["inprogress_invasion"] = "Alguém já está trabalhando na porta..",
        ["no_invasion"] = "Esta porta não está arrombada..",
        ["realestate_only"] = "Apenas imóveis podem usar este comando",
        ["emergency_services"] = "Isso só é possível para serviços de emergência!",
        ["already_owned"] = "Esta casa já é propriedade!",
        ["not_enough_money"] = "Você não tem dinheiro suficiente..",
        ["remove_key_from"] = "As chaves foram removidas de %{firstname} %{lastname}",
        ["already_keys"] = "Essa pessoa já tem as chaves da casa!",
        ["something_wrong"] = "Algo deu errado tente novamente!",
        ["nobody_at_door"] = 'Não há ninguém na porta...'
    },
    success = {
        ["unlocked"] = "A casa está desbloqueada!",
        ["home_invasion"] = "A porta está agora aberta.",
        ["lock_invasion"] = "Você trancou a casa novamente..",
        ["recieved_key"] = "Você tem as chaves de %{value} recebido!",
        ["house_purchased"] = "Você comprou a casa com sucesso!"
    },
    info = {
        ["door_ringing"] = "Alguém está tocando a porta!",
        ["speed"] = "A velocidade é %{value}",
        ["added_house"] = "Você adicionou uma casa: %{value}",
        ["added_garage"] = "Você adicionou uma garagem: %{value}",
        ["exit_camera"] = "Sair da câmera",
        ["house_for_sale"] = "Casa à venda",
        ["decorate_interior"] = "Decorar Interior",
        ["create_house"] = "Criar casa (somente imóveis)",
        ["price_of_house"] = "Preço da casa",
        ["tier_number"] = "Número do nível da casa",
        ["add_garage"] = "Adicionar garagem residencial (somente imóveis)",
        ["ring_doorbell"] = "Tocar a campainha"
    },
    menu = {
        ["house_options"] = "Opções de casas",
        ["close_menu"] = "⬅ Fechar Menu",
        ["enter_house"] = "Entre na sua casa",
        ["give_house_key"] = "Dê a chave da casa",
        ["exit_property"] = "Sair da propriedade",
        ["front_camera"] = "Câmera frontal",
        ["back"] = "De volta",
        ["remove_key"] = "Remover chave",
        ["open_door"] = "Porta aberta",
        ["view_house"] = "Ver casa",
        ["ring_door"] = "Campainha de toque",
        ["exit_door"] = "Sair da propriedade",
        ["open_stash"] = "Abrir Baú",
        ["stash"] = "Esconderijo",
        ["change_outfit"] = "Mudar roupa",
        ["outfits"] = "Roupas",
        ["change_character"] = "Alterar caractere",
        ["characters"] = "Personagens",
        ["enter_unlocked_house"] = "Entre na casa desbloqueada",
        ["lock_door_police"] = "Porta fechada"
    },
    target = {
        ["open_stash"] = "[E] Abrir Baú",
        ["outfits"] = "[E] Mudar roupas",
        ["change_character"] = "[E] Alterar caractere",
    },
    log = {
        ["house_created"] = "Casa criada:",
        ["house_address"] = "**Endereço**: %{label}\n\n**Preço de listagem**: %{price}\n\n**Camada**: %{tier}\n\n**Agente de listagem**: %{agent}",
        ["house_purchased"] = "Casa comprada:",
        ["house_purchased_by"] = "**Endereço**: %{house}\n\n**Preço de compra**: %{price}\n\n**Comprador**: %{firstname} %{lastname}"
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

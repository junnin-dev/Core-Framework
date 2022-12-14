local Translations = {
    error = {
        has_no_drugs = "Você não está carregando nenhuma droga com você",
        not_enough_police = "Não há policiais suficientes de plantão (%{polices} required)",
        no_drugs_left = "Não há mais drogas para vender",
        too_far_away = "Mudou para muito longe",
        offer_declined = "Oferta recusada",
        no_player_nearby = "Nenhum jogador por perto",
        pending_delivery = "Você ainda precisa concluir uma entrega, o que está esperando?!",
        item_unavailable = "Este item não está disponível, você recebeu um reembolso",
        order_not_right = "Isso não atende ao pedido",
        too_late = "Você está muito atrasado",
        dealer_already_exists = "Já existe um revendedor com este nome",
        dealer_not_exists = "Este revendedor não existe",
        no_dealers = "Nenhum revendedor foi colocado",
        dealer_not_exists_command = "Distribuidor %{dealerName} não existe"
    },
    success = {
        helped_player = "Você ajudou uma pessoa a se levantar",
        route_has_been_set = "A rota para o local de entrega foi definida no seu mapa",
        teleported_to_dealer = "Você foi teletransportado para %{dealerName}",
        offer_accepted = "Oferta aceita",
        order_delivered = "O pedido foi entregue",
        dealer_deleted = "Distribuidor %{dealerName} foi deletado"
    },
    info = {
        started_selling_drugs = "Você começou a vender drogas",
        stopped_selling_drugs = "Você parou de vender drogas",
        has_been_robbed = "Você foi roubado e perdido %{bags} sacola(s) %{drugType}",
        suspicious_situation = "Situação suspeita",
        possible_drug_dealing = "Possível tráfico de drogas",
        drug_offer = "[E] %{bags}x %{drugLabel} por $%{randomPrice}? / [G] Recusar oferta",
        target_drug_offer = "Vender %{bags}x %{drugLabel} por $%{randomPrice}?",
        search_ped = "Pesquisar ped",
        pick_up_button = "[E] Pegar",
        knock_button = "[E] Bater",
        target_knock = 'Bata na porta',
        target_deliver = 'Entregar drogas',
        target_openshop = 'Loja aberta',
        target_request = 'Solicitar entrega',
        mystery_man_button = "[E] Comprar / [G] Ajude seu cara ($5000)",
        other_dealers_button = "[E] Comprar / [G] Iniciar uma missão",
        reviving_player = "Ajudando a pessoa a fazer backup...",
        dealer_name = "Distribuidor %{dealerName}",
        sending_delivery_email = "Estes são os produtos, manterei contato por e-mail",
        mystery_man_knock_message = "Olá meu filho, o que posso fazer por você?",
        treated_fred_bad = "Infelizmente eu não faço mais negócios... Você deveria ter me tratado melhor",
        fred_knock_message = "Elas %{firstName}, O que posso fazer para você?",
        no_one_home = "Parece que ninguém está em casa",
        delivery_info_email = "Aqui estão todas as informações sobre a entrega, <br>Itens: <br> %{itemAmount}x %{itemLabel}<br><br> ser pontual",
        deliver_items_button = "[E] %{itemAmount}x %{itemLabel} entregar",
        delivering_products = "Entregando produtos...",
        drug_deal_alert = "911: Tráfico de drogas",
        perfect_delivery = "Você fez um bom trabalho, espero vê-lo novamente ;)<br><br>Saudações, %{dealerName}",
        bad_delivery = "Recebi reclamações sobre sua entrega, não deixe isso acontecer novamente",
        late_delivery = "Você não estava na hora. Você tinha coisas mais importantes para fazer do que negócios?",
        police_message_server = "Uma situação suspeita foi localizada em %{street}, possível tráfico de drogas",
        drug_deal = "Tráfico de drogas",
        newdealer_command_desc = "Coloque um revendedor (somente administrador)",
        newdealer_command_help1_name = "nome",
        newdealer_command_help1_help = "Nome do vendedor",
        newdealer_command_help2_name = "min",
        newdealer_command_help2_help = "Tempo mínimo",
        newdealer_command_help3_name = "máximo",
        newdealer_command_help3_help = "Tempo Máximo",
        deletedealer_command_desc = "Excluir um revendedor (somente administrador)",
        deletedealer_command_help1_name = "nome",
        deletedealer_command_help1_help = "Nome do vendedor",
        dealers_command_desc = "Ver todos os revendedores (somente administrador)",
        dealergoto_command_desc = "Teletransporte para um revendedor (somente administrador)",
        dealergoto_command_help1_name = "nome",
        dealergoto_command_help1_help = "Nome do vendedor",
        list_dealers_title = "Lista de todos os revendedores: ",
        list_dealers_name_prefix = "Nome: "
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
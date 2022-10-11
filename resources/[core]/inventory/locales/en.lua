local Translations = {
    progress = {
        ["crafting"] = "Crafting...",
        ["snowballs"] = "Coletando bolas de neve..",
    },
    notify = {
        ["failed"] = "Fracassada",
        ["canceled"] = "Cancelada",
        ["vlocked"] = "Veículo trancado",
        ["notowned"] = "Você não possui este item!",
        ["missitem"] = "Você não tem este item!",
        ["nonb"] = "Ninguém por perto!",
        ["noaccess"] = "Não acessível",
        ["nosell"] = "Você não pode vender este item ..",
        ["itemexist"] = "Item não existe ??",
        ["notencash"] = "Você não tem dinheiro suficiente ..",
        ["noitem"] = "Você não tem os itens certos ..",
        ["gsitem"] = "Você não pode dar a si mesmo um item?",
        ["tftgitem"] = "Você está muito longe para dar itens!",
        ["infound"] = "Item que você tentou dar não encontrado!",
        ["iifound"] = "Item incorreto encontrado tente novamente!",
        ["gitemrec"] = "Você recebeu ",
        ["gitemfrom"] = " A partir de ",
        ["gitemyg"] = "Você deu ",
        ["gitinvfull"] = "Os outros jogadores inventários estão cheios!",
        ["giymif"] = "Seu inventário está cheio!",
        ["gitydhei"] = "Você não tem o suficiente do item",
        ["gitydhitt"] = "Você não tem itens suficientes para transferir",
        ["navt"] = "Não é um tipo válido ..",
        ["anfoc"] = "Argumentos não preenchidos corretamente ..",
        ["yhg"] = "Você deu",
        ["cgitem"] = "Não posso dar o item!",
        ["idne"] = "O item não existe",
        ["pdne"] = "Jogador não está online",
    },
    inf_mapping = {
        ["opn_inv"] = "Abrir Inventory",
        ["tog_slots"] = "Alterna os slots de keybind",
        ["use_item"] = "Usa o item no slot ",
    },
    menu = {
        ["vending"] = "Maquina de vendas",
        ["craft"] = "Craft",
        ["o_bag"] = "Bolsa aberta",
    },
    interaction = {
        ["craft"] = "~g~E~w~ - Craft",
    },
    label = {
        ["craft"] = "Crafting",
        ["a_craft"] = "Attachment Crafting",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

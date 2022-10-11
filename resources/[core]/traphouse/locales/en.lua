local Translations = {
    error = {
        not_enough = "Você não tem dinheiro suficiente..",
        no_slots = "Não há mais slots",
        occured = "Um erro ocorreu",
        have_keys = "Esta pessoa já tem chaves",
        p_have_keys = "%{value} Esta pessoa já tem chaves",
        not_owner = "Você não possui um traphouse ou não é o proprietário",
        not_online = "Esta pessoa não está na cidade",
        no_money = "Não há dinheiro no armário",
        incorrect_code = "Este código está incorreto",
        up_to_6 = "Você pode dar acesso a até 6 pessoas na Trap House!",
        cancelled = "Aquisições canceladas",
    },
    success = {
        added = "%{value} Foi adicionado ao Traphouse!",
    },
    info = {
        enter = "Entrar no Traphouse",
        give_keys = "Dê as Chaves da Traphouse",
        pincode = "Traphouse Pincode: %{value}",
        taking_over = "Assumindo",
        pin_code_see = "~b~G~w~ - Ver Pin Code",
        pin_code = "Pincode: %{value}",
        multikeys = "~b~/multikeys~w~ [id] - Para dar as chaves",
        take_cash = "~b~E~w~ - Receber dinheiro (~g~$%{value}~w~)",
        inventory = "~b~H~w~ - Ver Inventário",
        take_over = "~b~E~w~ - Assumir (~g~$5000~w~)",
        leave = "~b~E~w~ - Sair do Traphouse",
    },
    targetInfo = {
        options = "Opções de Traphouse",
        enter = "Entrar no Traphouse",
        give_keys = "Dê as Chaves da Traphouse",
        pincode = "Traphouse Pincode: %{value}",
        taking_over = "Assumindo",
        pin_code_see = "Ver Pin Code",
        pin_code = "Pincode: %{value}",
        multikeys = "Dê as chaves (use /multikey [id])",
        take_cash = "Receber dinheiro ($%{value})",
        inventory = "Ver Inventário",
        take_over = "Assumir ($5000)",
        leave = "Sair do Traphouse",
        close_menu = "⬅ Fechar Menu",
    }
}

    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })


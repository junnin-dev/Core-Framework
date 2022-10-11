local Translations = {
    error = {
        ["missing_something"] = "Parece que está faltando algo...",
        ["not_enough_police"] = "Não chega polícia..",
        ["door_open"] = "A porta já está aberta..",
        ["cancelled"] = "Processo cancelado..",
        ["didnt_work"] = "Não funcionou..",
        ["emty_box"] = "A Caixa Está Vazia..",
        ["injail"] = "Você está na cadeia por %{Time} meses..",
        ["item_missing"] = "Está faltando um item..",
        ["escaped"] = "Você escapou... Dê o fora daqui.!",
        ["do_some_work"] = "Faça algum trabalho para redução de sentença, emprego instantâneo: %{currentjob} ",
    },
    success = {
        ["found_phone"] = "Você encontrou um telefone..",
        ["time_cut"] = "Você trabalhou algum tempo fora de sua sentença.",
        ["free_"] = "Você é livre! Apreciá-lo! :)",
        ["timesup"] = "Seu tempo acabou! Confira-se no centro de visitantes",
    },
    info = {
        ["timeleft"] = "Você ainda tem que... %{JAILTIME} meses",
        ["lost_job"] = "Você está desempregado",
        ["job_interaction"] = "[E] Trabalho de eletricidade",
    }
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

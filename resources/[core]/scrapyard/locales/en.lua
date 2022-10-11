local Translations = {
    error = {
        smash_own = "Você não pode esmagar um veículo que o possui.",
        cannot_scrap = "Este veículo não pode ser descartado.",
        not_driver = "Você não é o motorista",
        demolish_vehicle = "Você não tem permissão para demolir veículos agora",
        canceled = "Cancelada",
    },
    text = {
        scrapyard = 'Pátio de sucata',
        disassemble_vehicle = '[E] - Desmonte o veículo',
        disassemble_vehicle_target = 'Desmonte o veículo',
        email_list = "[E] - Lista de veículos de e-mail",
        email_list_target = "Lista de veículos de e-mail",
        demolish_vehicle = "Demolir veículo",
    },
    email = {
        sender = "Turner's Auto Wrecking",
        subject = "Lista de veículos",
        message = "Você só pode demolir vários veículos.<br />Você pode manter tudo o que demolir por si mesmo, desde que não me incomode.<br /><br /><strong>Lista de veículos:</strong><br />",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

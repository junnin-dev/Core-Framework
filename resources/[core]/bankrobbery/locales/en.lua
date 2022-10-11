local Translations = {
    success = {
        success_message = "Bem-sucedida",
        fuses_are_blown = "Os fusíveis foram soprados",
        door_has_opened = "A porta se abriu"
    },
    error = {
        cancel_message = "Cancelada",
        safe_too_strong = "Parece que a trava segura é muito forte ...",
        missing_item = "Você está perdendo um item ...",
        bank_already_open = "O banco já está aberto ...",
        minimum_police_required = "Mínimo de %{police} A polícia exigia",
        security_lock_active = "O bloqueio de segurança está ativo, a abertura da porta não é possível atualmente",
        wrong_type = "%{receiver} não recebeu o tipo certo de argumento '%{argument}'\nTipo recebeu: %{receivedType}\nValor recebido: %{receivedValue}\n Tipo esperado: %{expected}",
        fuses_already_blown = "Os fusíveis já estão soprados ...",
        event_trigger_wrong = "%{event}%{extraInfo} foi acionado quando algumas condições não foram atendidas, fonte: %{source}",
        missing_ignition_source = "Você está perdendo uma fonte de ignição"
    },
    general = {
        breaking_open_safe = "Quebrando o Aberto Seguro ... ",
        connecting_hacking_device = "Conectando o dispositivo de hackers ...",
        fleeca_robbery_alert = "Tentativa de assalto a banco Fleeca",
        paleto_robbery_alert = "Tentativa de assalto ao banco de poupança do condado de Blaine",
        pacific_robbery_alert = "Pacific Standard Bank Robbery Tentativa",
        break_safe_open_option_target = "breakSafeOpen",
        break_safe_open_option_drawtext = "[E] Quebrar o cofre",
        validating_bankcard = "Cartão de validação ...",
        thermite_detonating_in_seconds = "Thermite está saindo %{time} second(s)",
        bank_robbery_police_call = "10-90: Assalto a banco"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

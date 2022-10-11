local Translations = {
    error = {
        not_give = "Não foi possível dar o item ao ID fornecido.",
        givecash = "Uso /givecash [ID] [QUANTIA]",
        wrong_id = "ID errado.",
        dead = "Você está morto lol.",
        too_far_away = "Você está muito longe LMFAO.",
        not_enough = "Você não tem esse valor.",
        invalid_amount = "Quantidade inválida fornecida"
    },
    success = {
        debit_card = "Você pediu com sucesso um cartão de débito.",
        cash_deposit = "Você fez um depósito em dinheiro com sucesso de $%{value}.",
        cash_withdrawal = "Você fez uma retirada de dinheiro com sucesso de $%{value}.",
        updated_pin = "Você atualizou com sucesso seu pino de cartão de débito.",
        savings_deposit = "Você fez um depósito de poupança com sucesso de $%{value}.",
        savings_withdrawal = "Você fez uma retirada de economia com sucesso de $%{value}.",
        opened_savings = "Você abriu com sucesso uma conta poupança.",
        give_cash = "Deu sucesso $%{cash} para id %{id}",
        received_cash = "Recebido com sucesso $%{cash} de id %{id}"
    },
    info = {
        bank_blip = "Bank",
        access_bank_target = "Banco de Acesso",
        access_bank_key = "[E] - Banco de Acesso",
        current_to_savings = "Transferir a conta corrente para economizar",
        savings_to_current = "Transferir economia para a conta corrente",
        deposit = "Depósito $%{amount} em conta corrente",
        withdraw = "Retirar $%{amount} da conta corrente",
    },
    command = {
        givecash = "Dê dinheiro ao jogador."
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

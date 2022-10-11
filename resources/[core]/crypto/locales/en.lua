local Translations = {
    error = {
        you_dont_have_a_cryptostick = 'Você não tem um cryptostick',
        one_bus_active = 'Você só pode ter um ônibus ativo de cada vez',
        drop_off_passengers = 'Entre os passageiros antes de parar de trabalhar',
        cryptostick_malfunctioned = 'Cryptostick com defeito'
    },
    success = {
        you_have_exchanged_your_cryptostick_for = 'Você trocou seu cripto -truque por: %{amount} QBit(s)'
    },
    credit = {
        there_are_amount_credited = 'Há %{amount} Qbit(s) creditada!',
        you_have_qbit_purchased = 'Você tem %{dataCoins} Qbit(s) comprada!'
    },
    depreciation = {
        you_have_sold = 'Você tem %{dataCoins} Qbit(s) vendida!'
    },
    text = {
        enter_usb = '[E] - Enter USB',
        system_is_rebooting = 'O sistema está reiniciando - %{rebootInfoPercentage} %',
        you_have_not_given_a_new_value = 'Você não deu um novo valor .. valores atuais: %{crypto}',
        this_crypto_does_not_exist = 'Esta criptografia não existe :(, acessível: Qbit',
        you_have_not_provided_crypto_available_qbit = 'Você não forneceu Crypto, acessível: Qbit',
        the_qbit_has_a_value_of = 'O QBIT tem um valor de: %{crypto}',
        you_have_with_a_value_of = 'Você tem: %{playerPlayerDataMoneyCrypto} Qbit, com um valor de: %{mypocket},-'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

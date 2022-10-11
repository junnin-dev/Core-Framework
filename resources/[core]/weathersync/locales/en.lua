local Translations = {
    weather = {
        now_frozen = 'O tempo agora está congelado.',
        now_unfrozen = 'O tempo não está mais congelado.',
        invalid_syntax = 'Sintaxe inválida, a sintaxe correta é: /weather <weathertype> ',
        invalid_syntaxc = 'Sintaxe inválida, use /weather <weatherType> em vez de!',
        updated = 'O tempo foi atualizado.',
        invalid = 'Tipo de clima inválido, tipos de clima válidos são: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        invalidc = 'Tipo de clima inválido, tipos de clima válidos são: \nEXTRASUNNY CLEAR NEUTRAL SMOG FOGGY OVERCAST CLOUDS CLEARING RAIN THUNDER SNOW BLIZZARD SNOWLIGHT XMAS HALLOWEEN ',
        willchangeto = 'O tempo mudará para: %{value}.',
        accessdenied = 'Acesso para comando /weather negado.',
    },
    dynamic_weather = {
        disabled = 'Dynamic as mudanças climáticas agora estão desativadas.',
        enabled = 'Dynamic as mudanças climáticas agora estão habilitadas.',
    },
    time = {
        frozenc = 'O tempo agora está congelado.',
        unfrozenc = 'O tempo não está mais congelado.',
        now_frozen = 'O tempo agora está congelado.',
        now_unfrozen = 'O tempo não está mais congelado.',
        morning = 'Horário definido para a manhã.',
        noon = 'Horário definido para o meio-dia.',
        evening = 'Hora definida para a noite.',
        night = 'Hora marcada para a noite.',
        change = 'O tempo mudou para %{value}:%{value2}.',
        changec = 'O horário foi alterado para: %{value}!',
        invalid = 'Sintaxe inválida, a sintaxe correta é: time <hour> <minute> !',
        invalidc = 'Sintaxe inválida. Usar /time <hour> <minute> instead!',
        access = 'Acesso para comando /time negado.',
    },
    blackout = {
        enabled = 'O blecaute agora está ativado.',
        enabledc = 'O blecaute agora está ativado.',
        disabled = 'O blackout agora está desativado.',
        disabledc = 'O blackout agora está desativado.',
    },
    help = {
        weathercommand = 'Mude o clima.',
        weathertype = 'tipo de clima',
        availableweather = 'Tipos disponíveis: extrasunny, clear, neutral, smog, foggy, overcast, clouds, clearing, rain, thunder, snow, blizzard, snowlight, xmas & halloween',
        timecommand = 'Mude o tempo.',
        timehname = 'horas',
        timemname = 'minutos',
        timeh = 'Um número entre 0 - 23',
        timem = 'Um número entre 0 - 59',
        freezecommand = 'Congelar / unfreeze Tempo.',
        freezeweathercommand = 'Ativar/desativar mudanças climáticas dinâmicas.',
        morningcommand = 'Defina o tempo para 09:00',
        nooncommand = 'Defina o tempo para 12:00',
        eveningcommand = 'Defina o tempo para 18:00',
        nightcommand = 'Defina o tempo para 23:00',
        blackoutcommand = 'Alterne o modo de escurecimento.',
    },
}

    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })


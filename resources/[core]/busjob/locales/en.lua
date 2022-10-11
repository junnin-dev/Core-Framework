local Translations = {
    error = {
        already_driving_bus = 'Você já está dirigindo um ônibus',
        not_in_bus = 'Você não está em um ônibus',
        one_bus_active = 'Você só pode ter um ônibus ativo de cada vez',
        drop_off_passengers = 'Deixe os passageiros antes de parar de trabalhar'
    },
    success = {
        dropped_off = 'Pessoa foi deixada',
    },
    info = {
        bus = 'Barramento padrão',
        goto_busstop = 'Vá para o ponto de ônibus',
        busstop_text = '[E] Ponto de ônibus',
        bus_plate = 'ÔNIBUS', -- Can be 3 or 4 characters long (uses random 4 digits)
        bus_depot = 'Depósito de ônibus',
        bus_stop_work = '[E] Parar de trabalhar',
        bus_job_vehicles = '[E] Veículos de trabalho'
    },
    menu = {
        bus_header = 'Veículos de ônibus',
        bus_close = '⬅ Feche o menu'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

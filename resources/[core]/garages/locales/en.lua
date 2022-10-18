local Translations = {
    error = {
        no_vehicles = "Não há veículos neste local!",
        not_impound = "Seu veículo não está em impacto",
        not_owned = "Este veículo não pode ser armazenado",
        not_correct_type = "Você não pode armazenar esse tipo de veículo aqui",
        not_enough = "Dinheiro insuficiente",
        no_garage = "Nenhum",
        too_far_away = "Muito longe de um estacionamento",
        occupied = "O estacionamento já está ocupado",
        all_occupied = "Todos os lugares de estacionamento estão ocupados",
        no_vehicle = "Não há veículo para estacionar",
        no_house_keys = "Você não tem as chaves para esta garagem da casa",
    },
    success = {
        vehicle_parked = "Veículo armazenado",
    },
    menu = {
        header = {
            house_garage = "Garagem da casa",
            house_car = "Garagem da casa %{value}",
            public_car = "Garagem pública %{value}",
            public_sea = "Boathouse pública %{value}",
            public_air = "Hangar público %{value}",
            job_car = "Jó Garage %{value}",
            job_sea = "Jó Boathouse %{value}",
            job_air = "Hangar de emprego %{value}",
            gang_car = "Garagem de gangues %{value}",
            gang_sea = "Boathouse de gangue %{value}",
            gang_air = "Hangar de gangue %{value}",
            depot_car = "depósito %{value}",
            depot_sea = "depósito %{value}",
            depot_air = "depósito %{value}",
            vehicles = "Disponível Vehicles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Sair da garagem",
            sea = "⬅ Sair da Boathouse",
            air = "⬅ Sair do Hangar",
            job = "⬅ Sair da Garage"
        },
        text = {
            vehicles = "Ver veículos armazenados!",
            depot = "Placa: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Corpo: %{value4}",
            garage = "State: %{value}<br>Gasolina: %{value2} | Motor: %{value3} | Corpo: %{value4}",
        }
    },
    status = {
        out = "Out",
        garaged = "Garaged",
        impound = "Impounded",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

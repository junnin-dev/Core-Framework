local Translations = {
    error = {
        no_vehicles = "Não há veículos neste local!",
        not_impound = "Seu veículo não está apreendido",
        not_owned = "Este veículo não pode ser armazenado",
        not_correct_type = "Você não pode armazenar este tipo de veículo aqui",
        not_enough = "Dinheiro insuficiente",
        no_garage = "Nenhum",
        vehicle_occupied = "Você não pode armazenar este veículo, pois não está vazio",
    },
    success = {
        vehicle_parked = "Veículo armazenado",
    },
    menu = {
        header = {
            house_car = "Casa Garagem %{value}",
            public_car = "Garagem Pública %{value}",
            public_sea = "Barco Público %{value}",
            public_air = "Hangar público %{value}",
            job_car = "Oficina de Trabalho %{value}",
            job_sea = "Estaleiro de Emprego %{value}",
            job_air = "Hangar de Trabalho %{value}",
            gang_car = "Garagem de Gang %{value}",
            gang_sea = "Barco de gangues %{value}",
            gang_air = "Hangar de gangues %{value}",
            depot_car = "depósito %{value}",
            depot_sea = "depósito %{value}",
            depot_air = "depósito %{value}",
            vehicles = "Disponível Vehicles",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "⬅ Sair da garagem",
            sea = "⬅ Sair da casa de barcos",
            air = "⬅ Sair do Hangar",
        },
        text = {
            vehicles = "Ver veículos armazenados!",
            depot = "Placa: %{value}<br>Combustível: %{value2} | Motor: %{value3} | Corpo: %{value4}",
            garage = "Estado: %{value}<br>Combustível: %{value2} | Motor: %{value3} | Corpo: %{value4}",
        }
    },
    status = {
        out = "Fora",
        garaged = "Garagem",
        impound = "Apreendido pela polícia",
    },
    info = {
        car_e = "E - Garagem",
        sea_e = "E - Ancoradouro",
        air_e = "E - Hangar",
        park_e = "E - Armazenar Veículo",
        house_garage = "Garagem da casa",
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

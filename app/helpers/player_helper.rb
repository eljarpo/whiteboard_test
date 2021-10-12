module PlayerHelper

    def translate_special_ablities(ability)
        case ability
        when 'fire_resistance'
            'Resistencia al fuego'
        when 'cold_resistance'
            'Resistencia al frio'
        when 'venom_resistance'
            'Resistencia al veneno'
        when 'darkness_resistance'
            'Resistencia a la oscuridad'
        when 'movement_speed'
            'Velocidad de movimiento'
        when 'growth_speed'
            'Velocidad de crecimiento'
        when 'familiar_invocation'
            'Invocacion de familiar'
        else
            ability.humanize
        end
    end
end

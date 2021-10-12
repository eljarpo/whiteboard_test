class Player < ApplicationRecord
    before_create :generate_slug
    before_create :generate_access_code
    belongs_to :user, optional: true
    enum special_ability: [:fire_resistance, :cold_resistance, :venom_resistance, :darkness_resistance, :movement_speed, :growth_speed, :familiar_invocation ]
    validates :name, :presence => true, :uniqueness => true

    validates :power, :inclusion => 100..1000
    validates :attack, :inclusion => 100..1000
    validates :defense, :inclusion => 100..1000
    validates :charisma, :inclusion => 100..1000
    validates :spirit, :inclusion => 100..1000


    def avaliable_points
        2500 - (power + attack + defense + charisma + spirit) == 0
    end

    def to_param
        slug
    end
    
    def to_s
        slug
    end
    
    private

    def generate_slug
        self.slug = self.name.parameterize
    end

    def generate_access_code
        if user_id.nil?
            self.access_code = CouponCode.generate
        end
    end
end

class User < ApplicationRecord
    validates :name, length: {in: 2..20}
    validates :password, length: {in: 4..12}

    after_initialize {
        self.isBanned = false
    }
end

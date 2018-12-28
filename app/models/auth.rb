require 'jwt'

class Auth
    ALGORITHM = 'HS256'

    def self.encrypt(payload)
        JWT.encode(payload, secret_key, ALGORITHM)
    end

    def self.decode(token)
        JWT.decode(token, secret_key, true, { algorithm: ALGORITHM }).first
     end

    def self.secret_key
        'MFswDQYJKoZIhvcNAQEBBQADSgAwRwJAXsZn8xkvTLARveRumrtbHOFnBfx18zgDgrikcxERsEmN5qMrv0ivvWircRkxsC9sNu7r8QFiWZJ1VP1LfSfTwIDAQAB'
    end
end

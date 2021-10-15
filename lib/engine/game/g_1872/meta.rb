# frozen_string_literal: true

require_relative '../meta'

module Engine
  module Game
    module G1872
      module Meta
        include Game::Meta

        DEV_STAGE = :prealpha
        PROTOTYPE = true

        GAME_SUBTITLE = 'Nippon'
        GAME_DESIGNER = 'Douglas Triggs'
        GAME_LOCATION = 'Ignore Me'
        # GAME_INFO_URL = 'https://github.com/tobymao/18xx/wiki/18Tokaido'
        # GAME_RULES_URL = ''

        PLAYER_RANGE = [3, 7].freeze
      end
    end
  end
end

# frozen_string_literal: true

require_relative '../passer'

module Engine
  module Step
    class Base
      include Passer

      ACTIONS = [].freeze

      def initialize(game, round, **opts)
        @game = game
        @log = game.log
        @round = round
        @opts = opts
      end

      def description
        raise NotImplementedError
      end

      def pass_description
        'Pass'
      end

      def actions(_entity)
        []
      end

      def process_pass(_action)
        pass!
      end

      def current_actions
        current_entity ? actions(current_entity) : []
      end

      def current_entity
        active_entities[0]
      end

      def active_entities
        [entities[entity_index]]
      end

      def round_state
        {}
      end

      def blocking?
        blocks? && current_actions.any?
      end

      def blocks?
        true
      end

      def sequential?
        false
      end

      def setup; end

      private

      def entities
        @round.entities
      end

      def entity_index
        @round.entity_index
      end
    end
  end
end

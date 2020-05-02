# frozen_string_literal: true

module View
  class Spreadsheet < Snabberb::Component
    needs :game

    def render
      h(:div, { style: {
        overflow: 'auto',
        margin: '0 -1rem'
      } }, [render_table])
    end

    def render_table
      h(:table, { style: {
        margin: '1rem 0 1.5rem 0',
        'text-align': 'center',
      } }, [
        *render_title,
        *render_corporations,
        h(:tr, [
          h(:td, { style: { width: '20px' } }, ''),
          h(:th, { attrs: { colspan: @game.players.size } }, 'Player Finances'),
        ]),
        render_player_cash,
        render_player_privates,
        render_player_worth,
        render_player_certs,
      ])
      # TODO: consider adding OR information (could do both corporation OR revenue and player change in value)
      # TODO: consider adding train availability
    end

    #def render_history_titles(corporations)
    #  last_turn, last_round = corporations.map do |c|
    #    last_turn, revenue = c.revenue_history.last
    #    [last_turn, revenue.last]
    #  end.max

    #  (1..last_turn).map do |turn|
    #    (1..last_round).map do |round|
    #      h(:th, "#{turn + 1}.#{round + 1}")
    #    end
    #  end
    #end

    #def render_history(corporation)
    #  corporation.revenue_history.flat_map do |or_hist|
    #    # '-' indicates an as yet unfloated company
    #    # ' ' indicates that the company has not yet operated
    #    or_hist.map { |or_rev| h(:td, or_rev.nil? ? '-' : @game.format_currency(or_rev)) }
    #  end
    #end

    def render_title
      #or_history_titles = render_history_titles(@game.corporations)
      [
        h(:tr, [
          h(:th, { style: { width: '20px' } }, ''),
          h(:th, { attrs: { colspan: @game.players.size } }, 'Players'),
          h(:th, { attrs: { colspan: 2 } }, 'Bank'),
          h(:th, { attrs: { colspan: 2 } }, 'Prices'),
          h(:th, { attrs: { colspan: 4 } }, 'Corporation'),
          h(:th, { style: { width: '20px' } }, ''),
          h(:th, { attrs: { colspan: or_history_titles.size } }, 'OR History'),
          ]),
        h(:tr, [
          h(:th, { style: { width: '20px' } }, ''),
          *@game.players.map { |p| h(:th, p.name) },
          h(:th, 'IPO'),
          h(:th, 'Market'),
          h(:th, 'IPO'),
          h(:th, 'Market'),
          h(:th, 'Cash'),
          h(:th, 'Trains'),
          h(:th, 'Tokens'),
          h(:th, 'Privates'),
          h(:th, { style: { width: '20px' } }, ''),
          #*or_history_titles
        ])
      ]
    end

    def render_corporations
      @game.corporations.map { |c| render_corporation(c) }
    end

    def render_corporation(corporation)
      corporation_color =
        {
          style: {
            background: corporation.color,
            color: '#ffffff'
          }
        }
      props = { style: {} }
      props[:style]['background-color'] = 'rgba(220,220,220,0.4)' unless corporation.floated?
      h(:tr, props, [
        h(:th, corporation_color, corporation.name),
        *@game.players.map do |p|
          h(:td, p.num_shares_of(corporation).to_s + (corporation.president?(p) ? '*' : ''))
        end,
        h(:td, corporation.num_shares_of(corporation)),
        h(:td, @game.share_pool.num_shares_of(corporation)),
        h(:td, corporation.par_price ? @game.format_currency(corporation.par_price.price) : ''),
        h(:td, corporation.share_price ? @game.format_currency(corporation.share_price.price) : ''),
        h(:td, @game.format_currency(corporation.cash)),
        h(:td, corporation.trains.map(&:name).join(',')),
        h(:td, "#{corporation.tokens.map { |t| t.used? ? 0 : 1 }.sum}/#{corporation.tokens.size}"),
        render_companies(corporation),
        h(:th, corporation_color, corporation.name),
        # Note that if the company is currently operating the last space will be blank, as its final
        #   revenue number will not yet be present. If we add columns after these, will need to
        #   fill that in
        #*render_history(corporation)
      ])
    end

    def render_companies(entity)
      h(:td, entity.companies.map(&:short_name).join(','))
    end

    def render_player_privates
      h(:tr, [
        h(:th, 'Privates'),
        *@game.players.map { |p| render_companies(p) }
      ])
    end

    def render_player_cash
      h(:tr, [
        h(:th, 'Cash'),
        *@game.players.map { |p| h(:td, @game.format_currency(p.cash)) }
      ])
    end

    def render_player_worth
      h(:tr, [
        h(:th, 'Worth'),
        *@game.players.map { |p| h(:td, @game.format_currency(p.value)) }
      ])
    end

    def render_player_certs
      h(:tr, [
        h(:th, 'Certs'),
        *@game.players.map { |p| h(:td, p.num_certs) }
      ])
    end
  end
end

require_remote "wave/wave.rb"
require_remote "wave/wave3.rb"

class Wave2 < Wave
  def initialize(game)
    super(20 * 60, Wave3.new(game), game, false)
    @game = game
  end

  def start
    p "Enter Wave 2"
  end

  def update
    super
    if(@time == 1)
      for i in 0..9 do
        if i % 3 == 0
            @game.add_enemy(EnemyB.new(rand(0..100), rand(0..100)))
        end
        @game.add_enemy(EnemyA.new(rand(540..640), rand(0..100)))
      end
    end
  end
end
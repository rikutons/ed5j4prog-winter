require_remote "enemy.rb"
include Math

class EnemyF < Enemy
  def initialize(x, y)
    image = Image.load('/images/Enemy/Enemy_00.png')
    super(30, 10, 1, x, y, image) #hp, ダメージ, 報酬を定義
    @time = 0
    @beforeHP = @hp
    @slow = 0
  end
  
  def update
    # 向きを中心方向に変更
    direction = Math.atan2((240 - self.y),(320 - self.x)) * 180 / Math::PI
    self.angle = direction + 90
    #HPが減った時スロウを付与
    if @hp < @beforeHP
        @slow = 1 * 60
        @beforeHP = @hp
    end
    # 中心に向かって移動
    if @slow > 0
        self.x += Math.cos(direction) / 4 / 2
        self.y += Math.sin(direction) / 4 / 2
        @slow -= 1
    else
        self.x += Math.cos(direction) / 4
        self.y += Math.sin(direction) / 4
    end
    # ランダムワープ
    if @time % 120 == 0
        self.x += rand(1..100) - 50
        self.y += rand(1..100) - 50
    end
    @time += 1
  end
end
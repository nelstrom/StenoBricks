module StenoBrickKit
  def self.symbols
    [
      {
        id: 'topRowPath',
        points: [
          'M 100 100',
          'C 100 080',
          '  150 080',
          '  150 100',
          'L 200 100',
          'L 200 150',
          'C 200 210',
          '  100 210',
          '  100 150',
          'z'
        ]
      },
      {
        id: 'bottomRowPath',
        points: [
          'M 100 100',
          'L 150 100',
          'C 150 080',
          '  200 080',
          '  200 100',
          'L 200 220',
          'C 200 280',
          '  100 280',
          '  100 220',
          'z'
        ]
      },
      {
        id: 'thumbFirstPath',
        points: [
          'M 100 100',
          'L 150 100',
          'C 150 080',
          '  200 080',
          '  200 100',
          'L 200 300',
          'C 200 360',
          '  100 360',
          '  100 300',
          'z'
        ]
      },
      {
        id: 'thumbSecondPath',
        points: [
          'M 100 100',
          'C 100 080',
          '  150 080',
          '  150 100',
          'L 200 100',
          'L 200 300',
          'C 200 360',
          '  100 360',
          '  100 300',
          'z'
        ]
      },
      {
        id: 'starKeyPath',
        points: [
          'M 100 100',
          'L 150 100',
          'C 150 080',
          '  250 080',
          '  250 100',
          'L 300 100',
          'L 300 220',
          'C 300 280',
          '  100 280',
          '  100 220',
          'z'
        ]
      },
      {
        id: 'numberKeyPath',
        points: [
          'M 100 100',
          'C 100 080',
          '  200 080',
          '  200 100',
          'L 200 150',
          'C 200 210',
          '  100 210',
          '  100 150',
          'z'
        ]
      }
    ]
  end

  def self.thumbs
    [
      {
        offset: 3.5,
        fill: 'light',
        symbol: '#thumbFirstPath'
      },
      {
        offset: 4.5,
        fill: 'dark',
        symbol: '#thumbSecondPath'
      },
      {
        offset: 5.5,
        fill: 'dark',
        symbol: '#thumbFirstPath'
      },
      {
        offset: 6.5,
        fill: 'light',
        symbol: '#thumbSecondPath'
      },
    ]
  end

  def self.starButton
    {
      offset: 4.5,
      fill: 'light',
      symbol: '#starKeyPath'
    }
  end

  def self.leftBottom
    [0,1,2,3].map do |i|
      {
        offset: i,
        fill: 'dark',
        symbol: '#bottomRowPath'
      }
    end
  end

  def self.leftTop
    [1,2,3].map do |i|
      {
        offset: i,
        fill: 'light',
        symbol: '#topRowPath'
      }
    end
  end

  def self.rightBottom
    [7,8,9,10,11].map do |i|
      {
        offset: i,
        fill: 'light',
        symbol: '#bottomRowPath'
      }
    end
  end

  def self.rightTop
    [7,8,9,10,11].map do |i|
      {
        offset: i,
        fill: 'dark',
        symbol: '#topRowPath'
      }
    end
  end

  def self.numberButton
    {
      offset: -0.5,
      fill: 'light',
      symbol: '#numberKeyPath'
    }
  end

  def self.buttons
    [
      thumbs,
      leftBottom,
      starButton,
      rightBottom,
      numberButton,
      leftTop,
      rightTop,
    ].flatten
  end
end

module Dimensions
  HORIZONTAL_UNIT = 100

  V_STARTER=100
  VERTICAL_UNIT_CURVE = 20
  TOP_HEIGHT = 50
  BOTTOM_HEIGHT = 120
  THUMB_HEIGHT = 200
end

module StenoBrickKit
  def self.symbols
    [
      {
        id: 'topRowPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'bottomRowPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'thumbFirstPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'thumbSecondPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::THUMB_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'starKeyPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.5} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.5} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*2.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::BOTTOM_HEIGHT}",
          "z"
        ]
      },
      {
        id: 'numberKeyPath',
        points: [
          "M #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER}",
          "C #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::VERTICAL_UNIT_CURVE*-1.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER}",
          "L #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "C #{Dimensions::HORIZONTAL_UNIT*1.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT + Dimensions::VERTICAL_UNIT_CURVE*3.0}",
          "  #{Dimensions::HORIZONTAL_UNIT*0.0} #{Dimensions::V_STARTER + Dimensions::TOP_HEIGHT}",
          "z"
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

  def self.labels
    [
      { :text => '#', :xPosition => 0, :width => 2 },
      { :text => 's', :xPosition => 2 },
      { :text => 't', :xPosition => 3 },
      { :text => 'k', :xPosition => 4 },
      { :text => 'p', :xPosition => 5 },
      { :text => 'w', :xPosition => 6 },
      { :text => 'h', :xPosition => 7 },
      { :text => 'r', :xPosition => 8 },
      { :text => 'a', :xPosition => 9 },
      { :text => 'o', :xPosition => 10 },
      { :text => '*', :xPosition => 11, :width => 2 },
      { :text => 'e', :xPosition => 13 },
      { :text => 'u', :xPosition => 14 },
      { :text => 'f', :xPosition => 15 },
      { :text => 'r', :xPosition => 16 },
      { :text => 'p', :xPosition => 17 },
      { :text => 'b', :xPosition => 18 },
      { :text => 'l', :xPosition => 19 },
      { :text => 'g', :xPosition => 20 },
      { :text => 't', :xPosition => 21 },
      { :text => 's', :xPosition => 22 },
      { :text => 'd', :xPosition => 23 },
      { :text => 'z', :xPosition => 24 },
    ]
  end
end

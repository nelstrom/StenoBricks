module Steno
  KEY_INFORMATION = {
    0  => { :label => '#', symbol: '#numberKeyPath',   side: '',      finger: '',        left: 0,  right:  2, shade: 'dark' },
    1  => { :label => 's', symbol: '#bottomRowPath',   side: 'left',  finger: 'pinky',   left: 2,  right:  3, shade: 'light' },
    2  => { :label => 't', symbol: '#topRowPath',      side: 'left',  finger: 'ring',    left: 3,  right:  4, shade: 'dark' },
    3  => { :label => 'k', symbol: '#bottomRowPath',   side: 'left',  finger: 'ring',    left: 4,  right:  5, shade: 'light' },
    4  => { :label => 'p', symbol: '#topRowPath',      side: 'left',  finger: 'middle',  left: 5,  right:  6, shade: 'dark' },
    5  => { :label => 'w', symbol: '#bottomRowPath',   side: 'left',  finger: 'middle',  left: 6,  right:  7, shade: 'light' },
    6  => { :label => 'h', symbol: '#topRowPath',      side: 'left',  finger: 'index',   left: 7,  right:  8, shade: 'dark' },
    7  => { :label => 'r', symbol: '#bottomRowPath',   side: 'left',  finger: 'index',   left: 8,  right:  9, shade: 'light' },
    8  => { :label => 'a', symbol: '#thumbFirstPath',  side: 'left',  finger: 'thumb',   left: 9,  right: 10, shade: 'dark' },
    9  => { :label => 'o', symbol: '#thumbSecondPath', side: 'left',  finger: 'thumb',   left: 10, right: 11, shade: 'light' },
    10 => { :label => '*', symbol: '#starKeyPath',     side: '',      finger: '',        left: 11, right: 13, shade: 'dark' },
    11 => { :label => 'e', symbol: '#thumbFirstPath',  side: 'right', finger: 'thumb',   left: 13, right: 14, shade: 'dark' },
    12 => { :label => 'u', symbol: '#thumbFirstPath',  side: 'right', finger: 'thumb',   left: 14, right: 15, shade: 'light' },
    13 => { :label => 'f', symbol: '#topRowPath',      side: 'right', finger: 'index',   left: 15, right: 16, shade: 'dark' },
    14 => { :label => 'r', symbol: '#bottomRowPath',   side: 'right', finger: 'index',   left: 16, right: 17, shade: 'light' },
    15 => { :label => 'p', symbol: '#topRowPath',      side: 'right', finger: 'middle',  left: 17, right: 18, shade: 'dark' },
    16 => { :label => 'b', symbol: '#bottomRowPath',   side: 'right', finger: 'middle',  left: 18, right: 19, shade: 'light' },
    17 => { :label => 'l', symbol: '#topRowPath',      side: 'right', finger: 'ring',    left: 19, right: 20, shade: 'dark' },
    18 => { :label => 'g', symbol: '#bottomRowPath',   side: 'right', finger: 'ring',    left: 20, right: 21, shade: 'light' },
    19 => { :label => 't', symbol: '#topRowPath',      side: 'right', finger: 'pinky',   left: 21, right: 22, shade: 'dark' },
    20 => { :label => 's', symbol: '#bottomRowPath',   side: 'right', finger: 'pinky',   left: 22, right: 23, shade: 'light' },
    21 => { :label => 'd', symbol: '#topRowPath',      side: 'right', finger: 'pinky',   left: 23, right: 24, shade: 'dark' },
    22 => { :label => 'z', symbol: '#bottomRowPath',   side: 'right', finger: 'pinky',   left: 24, right: 25, shade: 'light' },
  }

  class Keyboard

    def filter(params={})
      return KEY_INFORMATION.values if params.empty?
      KEY_INFORMATION.values.select do |item|
        return_me = true
        params.each do |target_key, target_value|
          if item[target_key] != target_value
            return_me = false
            break
          end
        end
        return_me
      end
    end
  end
end

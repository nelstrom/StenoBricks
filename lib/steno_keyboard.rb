module Steno
  KEY_INFORMATION = {
    0  => { :label => '#', symbol: '#numberKeyPath',   side: '',      finger: '',        left: 0,  right:  2, shade: 'light' },
    1  => { :label => 's', symbol: '#bottomRowPath',   side: 'left',  finger: 'pinky',   left: 2,  right:  3, shade: 'dark' },
    2  => { :label => 't', symbol: '#topRowPath',      side: 'left',  finger: 'ring',    left: 3,  right:  4, shade: 'light' },
    3  => { :label => 'k', symbol: '#bottomRowPath',   side: 'left',  finger: 'ring',    left: 4,  right:  5, shade: 'dark' },
    4  => { :label => 'p', symbol: '#topRowPath',      side: 'left',  finger: 'middle',  left: 5,  right:  6, shade: 'light' },
    5  => { :label => 'w', symbol: '#bottomRowPath',   side: 'left',  finger: 'middle',  left: 6,  right:  7, shade: 'dark' },
    6  => { :label => 'h', symbol: '#topRowPath',      side: 'left',  finger: 'index',   left: 7,  right:  8, shade: 'light' },
    7  => { :label => 'r', symbol: '#bottomRowPath',   side: 'left',  finger: 'index',   left: 8,  right:  9, shade: 'dark' },
    8  => { :label => 'a', symbol: '#thumbFirstPath',  side: 'left',  finger: 'thumb',   left: 9,  right: 10, shade: 'light' },
    9  => { :label => 'o', symbol: '#thumbSecondPath', side: 'left',  finger: 'thumb',   left: 10, right: 11, shade: 'dark' },
    10 => { :label => '*', symbol: '#starKeyPath',     side: '',      finger: '',        left: 11, right: 13, shade: 'light' },
    11 => { :label => 'e', symbol: '#thumbFirstPath',  side: 'right', finger: 'thumb',   left: 13, right: 14, shade: 'light' },
    12 => { :label => 'u', symbol: '#thumbFirstPath',  side: 'right', finger: 'thumb',   left: 14, right: 15, shade: 'dark' },
    13 => { :label => 'f', symbol: '#topRowPath',      side: 'right', finger: 'index',   left: 15, right: 16, shade: 'light' },
    14 => { :label => 'r', symbol: '#bottomRowPath',   side: 'right', finger: 'index',   left: 16, right: 17, shade: 'dark' },
    15 => { :label => 'p', symbol: '#topRowPath',      side: 'right', finger: 'middle',  left: 17, right: 18, shade: 'light' },
    16 => { :label => 'b', symbol: '#bottomRowPath',   side: 'right', finger: 'middle',  left: 18, right: 19, shade: 'dark' },
    17 => { :label => 'l', symbol: '#topRowPath',      side: 'right', finger: 'ring',    left: 19, right: 20, shade: 'light' },
    18 => { :label => 'g', symbol: '#bottomRowPath',   side: 'right', finger: 'ring',    left: 20, right: 21, shade: 'dark' },
    19 => { :label => 't', symbol: '#topRowPath',      side: 'right', finger: 'pinky',   left: 21, right: 22, shade: 'light' },
    20 => { :label => 's', symbol: '#bottomRowPath',   side: 'right', finger: 'pinky',   left: 22, right: 23, shade: 'dark' },
    21 => { :label => 'd', symbol: '#topRowPath',      side: 'right', finger: 'pinky',   left: 23, right: 24, shade: 'light' },
    22 => { :label => 'z', symbol: '#bottomRowPath',   side: 'right', finger: 'pinky',   left: 24, right: 25, shade: 'dark' },
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

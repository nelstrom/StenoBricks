module Steno
  KEY_INFORMATION = {
    0  => { :label => '#', symbol: '#numberKeyPath',   side: '',      row: '',       finger: '',        left: 0,  right:  2, shade: 'dark',  offset: -0.5 },
    1  => { :label => 's', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'pinky',   left: 2,  right:  3, shade: 'light', offset: 0 },
    2  => { :label => 't', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'ring',    left: 3,  right:  4, shade: 'dark',  offset: 1 },
    3  => { :label => 'k', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'ring',    left: 4,  right:  5, shade: 'light', offset: 1 },
    4  => { :label => 'p', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'middle',  left: 5,  right:  6, shade: 'dark',  offset: 2 },
    5  => { :label => 'w', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'middle',  left: 6,  right:  7, shade: 'light', offset: 2 },
    6  => { :label => 'h', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'index',   left: 7,  right:  8, shade: 'dark',  offset: 3 },
    7  => { :label => 'r', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'index',   left: 8,  right:  9, shade: 'light', offset: 3 },
    8  => { :label => 'a', symbol: '#thumbFirstPath',  side: 'left',  row: '',       finger: 'thumb',   left: 9,  right: 10, shade: 'dark',  offset: 3.5 },
    9  => { :label => 'o', symbol: '#thumbSecondPath', side: 'left',  row: '',       finger: 'thumb',   left: 10, right: 11, shade: 'light', offset: 4.5 },
    10 => { :label => '*', symbol: '#starKeyPath',     side: '',      row: '',       finger: '',        left: 11, right: 13, shade: 'dark',  offset: 4.5 },
    11 => { :label => 'e', symbol: '#thumbFirstPath',  side: 'right', row: '',       finger: 'thumb',   left: 13, right: 14, shade: 'dark',  offset: 5.5 },
    12 => { :label => 'u', symbol: '#thumbSecondPath', side: 'right', row: '',       finger: 'thumb',   left: 14, right: 15, shade: 'light', offset: 6.5 },
    13 => { :label => 'f', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'index',   left: 15, right: 16, shade: 'dark',  offset: 7 },
    14 => { :label => 'r', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'index',   left: 16, right: 17, shade: 'light', offset: 7 },
    15 => { :label => 'p', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'middle',  left: 17, right: 18, shade: 'dark',  offset: 8 },
    16 => { :label => 'b', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'middle',  left: 18, right: 19, shade: 'light', offset: 8 },
    17 => { :label => 'l', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'ring',    left: 19, right: 20, shade: 'dark',  offset: 9 },
    18 => { :label => 'g', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'ring',    left: 20, right: 21, shade: 'light', offset: 9 },
    19 => { :label => 't', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'pinky',   left: 21, right: 22, shade: 'dark',  offset: 10 },
    20 => { :label => 's', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'pinky',   left: 22, right: 23, shade: 'light', offset: 10 },
    21 => { :label => 'd', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'pinky',   left: 23, right: 24, shade: 'dark',  offset: 11 },
    22 => { :label => 'z', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'pinky',   left: 24, right: 25, shade: 'light', offset: 11 },
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

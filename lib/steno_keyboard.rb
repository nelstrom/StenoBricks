module Steno
  KEY_INFORMATION = {
    0  => { :label => '#', symbol: '#numberKeyPath',   side: '',      row: '',       finger: '',        left: 0,  right:  2, shade: 'dark',  offset: -0.5 },
    1  => { :label => 's', symbol: '#doubleRowPath',   side: 'left',  row: 'bottom', finger: 'pinky',   left: 2,  right:  4, shade: 'light', offset: 0.5 },
    2  => { :label => 't', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'ring',    left: 4,  right:  5, shade: 'dark',  offset: 1.5 },
    3  => { :label => 'k', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'ring',    left: 5,  right:  6, shade: 'light', offset: 1.5 },
    4  => { :label => 'p', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'middle',  left: 6,  right:  7, shade: 'dark',  offset: 2.5 },
    5  => { :label => 'w', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'middle',  left: 7,  right:  8, shade: 'light', offset: 2.5 },
    6  => { :label => 'h', symbol: '#topRowPath',      side: 'left',  row: 'top',    finger: 'index',   left: 8,  right:  9, shade: 'dark',  offset: 3.5 },
    7  => { :label => 'r', symbol: '#bottomRowPath',   side: 'left',  row: 'bottom', finger: 'index',   left: 9,  right: 10, shade: 'light', offset: 3.5 },
    8  => { :label => 'a', symbol: '#thumbFirstPath',  side: 'left',  row: '',       finger: 'thumb',   left: 10, right: 11, shade: 'dark',  offset: 4 },
    9  => { :label => 'o', symbol: '#thumbSecondPath', side: 'left',  row: '',       finger: 'thumb',   left: 11, right: 12, shade: 'light', offset: 5 },
    10 => { :label => '*', symbol: '#starKeyPath',     side: '',      row: '',       finger: '',        left: 12, right: 14, shade: 'light', offset: 5 },
    11 => { :label => 'e', symbol: '#thumbFirstPath',  side: 'right', row: '',       finger: 'thumb',   left: 14, right: 15, shade: 'dark',  offset: 6 },
    12 => { :label => 'u', symbol: '#thumbSecondPath', side: 'right', row: '',       finger: 'thumb',   left: 15, right: 16, shade: 'light', offset: 7 },
    13 => { :label => 'f', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'index',   left: 16, right: 17, shade: 'dark',  offset: 7.5 },
    14 => { :label => 'r', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'index',   left: 17, right: 18, shade: 'light', offset: 7.5 },
    15 => { :label => 'p', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'middle',  left: 18, right: 19, shade: 'dark',  offset: 8.5 },
    16 => { :label => 'b', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'middle',  left: 19, right: 20, shade: 'light', offset: 8.5 },
    17 => { :label => 'l', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'ring',    left: 20, right: 21, shade: 'dark',  offset: 9.5 },
    18 => { :label => 'g', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'ring',    left: 21, right: 22, shade: 'light', offset: 9.5 },
    19 => { :label => 't', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'pinky',   left: 22, right: 23, shade: 'dark',  offset: 10.5 },
    20 => { :label => 's', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'pinky',   left: 23, right: 24, shade: 'light', offset: 10.5 },
    21 => { :label => 'd', symbol: '#topRowPath',      side: 'right', row: 'top',    finger: 'pinky',   left: 24, right: 25, shade: 'dark',  offset: 11.5 },
    22 => { :label => 'z', symbol: '#bottomRowPath',   side: 'right', row: 'bottom', finger: 'pinky',   left: 25, right: 26, shade: 'light', offset: 11.5 },
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

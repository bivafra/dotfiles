function la --wraps='ls -a' --wraps='eza -a --icons=always --hyperlink' --description 'alias la=eza -a --icons=always --hyperlink'
  eza -a --icons=always --hyperlink $argv
        
end

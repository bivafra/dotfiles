function pacinst --wraps='sudo pacman -Syu' --description 'alias pacinst=sudo pacman -Syu'
  sudo pacman -Syu $argv
        
end

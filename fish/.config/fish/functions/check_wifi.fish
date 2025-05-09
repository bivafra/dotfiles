function check_wifi --wraps='ping -c linux.org' --wraps='ping -c 5 linux.org' --description 'alias check_wifi=ping -c 5 linux.org'
  ping -c 5 linux.org $argv
        
end

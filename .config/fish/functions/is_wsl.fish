function is_wsl --description 'Exit status 0 if on Windows Subsystem for Linux'
  string match -q '*icrosoft*' (uname -r)
end
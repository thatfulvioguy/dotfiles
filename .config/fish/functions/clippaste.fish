function clippaste --description 'Paste clipboard to stdout'
  if is_wsl
    powershell.exe -noprofile -command Get-Clipboard
  else
    # TODO does this also work in Wayland?
    xsel --clipboard --output
  end
end

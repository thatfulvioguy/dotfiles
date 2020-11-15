
function clipcopy --description 'Copy stdin to clipboard'
  if is_wsl
    clip.exe
  else
    # TODO does this also work in Wayland?
    xsel --clipboard --input
  end
end

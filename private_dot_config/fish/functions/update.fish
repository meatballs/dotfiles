function update
  sudo apt update
  sudo apt upgrade
  brew update
  brew upgrade
  uv tool upgrade --all
  npm upgrade -g
  nvim --headless "+Lazy! update" +qa
end

function update
  sudo apt update
  sudo apt upgrade -y
  sudo apt autoremove -y
  brew update
  brew upgrade -y
  uv tool upgrade --all
  npm upgrade -g
  nvim --headless "+Lazy! update" +qa
end

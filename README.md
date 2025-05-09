# Dotfiles
This repo contains dotfiles for some popular utils managed by [GNU Stow](https://www.gnu.org/software/stow/)

## Installation
1. Install `GNU Stow`:
    ```shell
    sudo apt install stow
    ```
    or 
    ```shell 
    sudo pacman -Syu stow
    ```
2. Clone the repo to **your home directory**:

    ```shell
    cd ~
    git clone git@github.com:bivafra/dotfiles.git
    ```
3. Incrementally install desired configs:
    ```shell
    cd dotfiles
    stow <name of directory>
    stow <name of directory>
    ...
    ```

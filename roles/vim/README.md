# VIM configuration

## Doc

Liste de liens utiles :
- Configuration :
  - https://www.arthurkoziel.com/setting-up-vim-for-yaml/index.html
  - https://draculatheme.com/vim
  - https://www.grottedubarbu.fr/vim-yaml-support/
  - https://vimconfig.com/
  - https://github.com/altercation/vim-colors-solarized
  - https://github.com/tpope/vim-pathogen
  - https://github.com/tpope/vim-sensible
  - https://github.com/vim-airline/vim-airline
  - https://github.com/Yggdroot/indentLine
- Utilisation :
  - https://learnvimscriptthehardway.stevelosh.com/
  - http://vimdoc.sourceforge.net/htmldoc/fold.html
- e-book:
  - https://vimebook.com/fr

### NeoVIM

 - https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/

## Pathogen

Installer __Pathogen__ :
```bash
mkdir -p ~/.vim/{autoload,bundle}
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
```

Editer le fichier de conf _~/.vimrc_ et ajouter les lignes suivantes au début :
```
set nocompatible " Annule la compatiblité avec l'ancêtre vi
call pathogen#infect()  " Active Pathogen
```

## Raccourcis

### Option Foldmethod/indent

Voici quelques raccourcis pour gérer tout ça :
 - zo ouvre le bloc sous le curseur
 - zO ouvre tous les blocs sous le curseur
 - zc fermer un bloc sous le curseur
 - zM ferme tous les blocs
 - zA ouvre/ferme tous les blocs sous le curseur
 - za ouvre/ferme le bloc sous le curseur


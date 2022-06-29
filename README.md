# nvim

## Install

Paste the file `init.vim` in `.config/nvim/init.vim` or make a symbolic link.

1) Instalar neovim
2) Instalar  to [Vim-Plug](https://github.com/junegunn/vim-plug#neovim) to neovim
3) 2) Crear fichero (donde se van poner los plugins y las configuraciones)
		nvim /home/_USER_/.config/nvim/init.vim
4) Abre `nvim` y escribe `:PlugUpdate`  para instalar y actualizar los plugins, y `:PlugUpgrade` para actualizar el propio gestor `vim-plug` 
5) Instalar esta [fuente](https://github.com/romkatv/powerlevel10k#manual-font-installation)
6) Pegar el fichero `init.vim` en _.config/nvim/init.vim_
7) Instala [bat](https://github.com/sharkdp/bat)
8) Instalar `zsh`
9) Instalar `ohmyzsh`
10) Install `z`
11) Install `the_silver_searcher`
12) [Install](https://releases.hashicorp.com/terraform-ls/) [terraform-ls](https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md) only download de binary and put in `/usr/local/bin/`. And execute in nvim `:CocConfig`  and paste the [next](https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#vim--neovim):

```bash
{
	"languageserver": {
		"terraform": {
			"command": "terraform-ls",
			"args": ["serve"],
			"filetypes": [
				"terraform",
				"tf"
			],
			"initializationOptions": {},
			"settings": {}
		}
	}
}
```

## Shortcuts and tricks

Color Html (night): `#1A1B26`

### Comentar
Para comentar y descomentar una linea  `gcc`
Para comentar y descomentar un bloque  `gc` 

### NerdTree
    t: Open the selected file in a new tab
    i: Open the selected file in a horizontal split window
    s: Open the selected file in a vertical split window
    I: Toggle hidden files
    m: Show the NERD Tree menu
    R: Refresh the tree, useful if files change outside of Vim
    ?: Toggle NERD Tree's quick help

### fzf.vim
`Ctrl + p`  -> Buscar nombre de fichero.
`Ctrl + f`  -> Buscar dentro de los ficheros.

**Ctrl+T**, **Ctrl+X**, or **Ctrl+V** to open the file in a new tab, split, or vertical split,

### Coc + Terraform
```
Ctrl + space = mostrar propiedades de un recurso.
gd = ir a la declaración del recurso.
```

### Cambiar entre pestañas de vim

```
Next tab: gt
Prior tab: gT
Numbered tab: _nnn_gt
```

### Atajos Fn's
`F2` -> NerdTree
`F3` -> Sacar/Ocultar numeros laterales
`F5` -> UndoTree
`F12` -> Sacar shell delante de Vim

# Plugin: VimTex

## Description

VimTeX is a plugin for LaTeX editing.
It provides syntax highlighting, easy compilation, a TOC tree, and PDF preview with forward/backward search support.

## Requirements

- latexmk (Latex Compiler)
- zathura (PDF viewer)

    For viewing the latex with correct backward & forward referencing it´s recommended to have
    a PDF viewer installed which support those functions

    On Arch
    ```bash
    sudo pacman -S zathura-pdf-mupdf
    ```

## Used Functionalities

- Allow easy Compilation
- See Compilation Errors in Quickfix
- TOC tree
- pdf view on save


## Commandos

All VimTeX commands begin with Vimtex, which makes them easy to identify in the command selector.


- `VimtexCompile` :
    Starts compilation of the file and opens the viewer
- `VimtexTocToggle` :
    Toggles the view of the toc tree of the latex document
- `VimtexView` :
    Allows to use the [Forward search](#forward-search)

## KeyBinding


The default leader is `<\>`.

The leader for the plugin is  `<\>`.
All functionalities can be accesd by using the keymaps


The most importend ones:

| Key          | Action                                   |
| ------------ | ---------------------------------------- |
| `<Leader>ll` | Compile LaTeX document (`VimtexCompile`) |
| `<Leader>lv` | View PDF (`VimtexView`)                  |
| `<Leader>lt` | Toggle TOC tree (`VimtexTocToggle`)      |




## Notes

### Configuring the plugin
Options can be configured by using the following command and search for the right parameter to edit
```lua
vim.g.vimtex_
```
options.


### Forward search

by using the `VimtexView` command you can use the Forward searche where the point of your your cursor
will be highlighted in the pdf viewer when supported

### Backward search

When yosing a PDF viewer which supports that you can select text in it and jump to
the position in the code

in zahura click

- `<CTRL-mouse_left>`

to jump to the position in the latex code

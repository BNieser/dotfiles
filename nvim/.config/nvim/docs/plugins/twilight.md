# Plugin: [twilight.nvim](https://github.com/folke/twilight.nvim)

## Description

Twilight.nvim is a Neovim plugin that dims inactive portions of the code,
helping you focus on the current context while editing.

It works especially well with **Tree-sitter** to intelligently highlight the
relevant code blocks around the cursor.

## Requirements

- Neovim `>= 0.8`
- Tree-sitter (recommended for best results)

## Features

- Dims inactive code to improve focus
- Tree-sitter–aware context detection
- Automatically expands relevant syntax nodes
- Highly configurable dimming behavior
- Works across multiple windows and buffers

## Commands

- `Twilight` : Toggle Twilight on
- `TwilightEnable` : To turn it on
- `TwilightDisable` : To turn it off


## Configuration

The plugin is configured using the following options:

### Dimming

Controls how inactive text is dimmed.

- `alpha`
  Opacity level for dimmed text.

- `color`
  Foreground color source (highlight group or fallback color).

- `term_bg`
  Background color used in terminal mode when `guibg` is `NONE`.

- `inactive`
  When enabled, other windows are fully dimmed unless they show the same buffer.

### Context

- `context`
  Number of lines shown above and below the current line.

### Tree-sitter Integration

- `treesitter`
  Enables Tree-sitter support when available.

- `expand`
  Syntax node types that should always remain fully visible.

  Default expanded nodes:
  - `function`
  - `method`
  - `table`
  - `if_statement`

### Excluded Filetypes

- `exclude`
  List of filetypes where Twilight should be disabled.

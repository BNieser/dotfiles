# Plugin: conform.nvim

## Description

Conform.nvim is a lightweight Neovim formatting plugin.

It provides fast and flexible code formatting by integrating
external formatters such as `stylua`, `ruff`, `prettier`, and `taplo`.

In this setup, formatting is automatically executed on save
and can be toggled on or off.

## Requirements

- Neovim `>= 0.8`
- Installed formatters via Mason
  - `stylua`
  - `ruff`
  - `prettier`
  - `taplo`

## Used Functionalities

- `formatters_by_ft`
  Defines which formatter is used per filetype.

- `format_on_save`
  Automatically formats the buffer when saving.

- `require("conform").format()`
  Manually trigger formatting.

> [!note]
> Only formatting features are used.
> Advanced features like injected language formatting are not required.

## Commands

- `:ConformInfo`
  Shows active formatters and configuration status.

## KeyBinding

- `<Leader> u f`
  Toggle autoformat on save.

- `<Leader> f`
  Manually format the current buffer.

## Configuration

### Enabled Formatters

- `lua` → `stylua`
- `python` → `ruff_format`
- `json` → `prettier`
- `markdown` → `prettier`
- `toml` → `taplo`

### Autoformat Toggle

Autoformat is controlled by a global variable.

When enabled:

- Buffer formats automatically on save.

When disabled:

- No formatting is performed on save.

The toggle is bound to:

- `<Leader> u f`

### Format on Save Behavior

- `timeout_ms = 1000`
- `lsp_fallback = true`

If no external formatter is available,
the LSP formatter will be used as fallback.

## Adding a new formater

1. Check if the desired formatter can be downloaded with `Mason` when yes add it under [`lsp-config`](../../lua/plugins/lsp-config.lua) for installing tools.
2. add the tool to the conform plugin and configure it accordingly.

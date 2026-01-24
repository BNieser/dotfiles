# Conventions


## Documenting Keys

Keyboard input **MUST** be documented using angle brackets.

### Single Keys

- `<w>` refers to pressing the `w` key
- `<a>` refers to pressing the `a` key

### Special Keys

Use the following names for special keys:

- `<CR>` — Enter
- `<Esc>` — Escape
- `<Tab>` — Tab
- `<BS>` — Backspace
- `<Space>` — Space
- `<Leader>` — Leader key

### Modifier Keys

Modifier keys are written as uppercase prefixes:

- `<C-x>` — Control + x
- `<S-x>` — Shift + x
- `<A-x>` — Alt + x
- `<M-x>` — Meta + x

Multiple modifiers are combined:

- `<C-S-k>` — Control + Shift + k
- `<C-A-h>` — Control + Alt + h

### Key Sequences

Key sequences are written as a space-separated list:

- `<Leader> f f` — press Leader, then `f`, then `f`
- `<C-w> v` — split window vertically

## Plugin Documentation Template

```markdown
# Plugin: <plugin-name>

## Description

Short description of what the plugin does.

## Requirements

- Neovim >= 0.x
- Optional dependencies

## Used Functionalities

What Function from the Plugin are used.

> [!note]
> When plugins have not much used function or None they could be removed


## Commandos

Contains what commands can be used to Use the Functionalities
They are most often mapped to KeyBinds but let´s  see


## KeyBinding
```

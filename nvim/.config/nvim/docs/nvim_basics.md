# Neovim


Neovim is a text editor which has a very good extensability



## Concepts


### Text Modes

Vim has several modes in which text can be edited.
In each different modes is a specific keymap active which can contain keybinding or is for actual
writing.

The main modes are:
- `Insert`:
    Here is the code inserted in to the code
- `Normal`:
    Here the cursor moves around the text
- `Visual`:
    Is for marking text and to allow to perform Motions on it


#### Swithcing between mode


Normal: ESC
Insert: i
Visual: v

#### Insert Mode


To switch from Normal mode into insert mode you can use the following commands:
- `<i>` : enter insert before the cursor
- `<I>` : enter insert and move to start of line
- `<a>` : enter insert after the cursor
- `<A>` : enter insert at the end of the current line
- `<o>` : enter insert in the line below
- `<O>` : enter insert in the line above


### Vim Motions





#### Using counts

Before executing a command yiu can also specify ho often it should be executed.
it can be done by adding a number before a motion

##### Usable Motions

- `<d>` : allows to delete text, put it´s put in a buffer
- `<c>` : allows to change the text, deletes the selectet and goes into insert




### Basic Navigation

The cursor can be moved with

```Text
h j k l
| | | |> move right
| | |> move up
| |> move down
|> move left
```

- `<w>` moves to the next word
- `<e>` moves to end of current word
- `<$>` moves to end of current line


### Jumoing around the file

- `<G>` : to bottom of file
- `<g> g` : to top of the file
- `<line_no> G` : jump to the given file number
- `<%>` : on a bracket jumps to the correpsponig bracket

### Delete the vibe code (Delete)

To delete you can use
- `<d>` : deletes the selected text
- `<x>` : deletes the character under the cursor

> [!note]
> When a text gets deleted by one of the methods up the deleted text will be copied in a buffer
> which then can be pasted. So it works like a cut tool.





### Playing the Stack overflow game (Copy/Paste) or lets yank it

- `<y>` : allows to yank (copy) selected text
- `<p>` : pastes text after the cursor






### Exiting & Saving

to exit neovim you have to run the command

```Vim
:q
```

to save a file type

```Vim
:w
```

to save all file use

```Vim
:wa
```

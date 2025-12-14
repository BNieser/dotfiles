
## Using of ZINIT

### Installation 

clone the repo in the zinit folder 
```bash
git clone https://github.com/zdharma-continuum/zinit.git ~/dotfiles/zsh/.zsh/zinit
```




## Plugins

### Jump plugins 

- easily jump around the filesystem

#### Commands

| Command              | Description                                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------|
| `jump <mark-name>`   | Jump to the given mark                                                                          |
| `mark [mark-name]`   | Create a mark with the given name or with the name of the current directory if none is provided |
| `unmark <mark-name>` | Remove the given mark                                                                           |
| `marks`              | List the existing marks and the directories they point to  

### Web Search 

- Allow to open the browser out of the terminal and search for something

can be used by typing:

`google <stuff-to-search>`


### CMD line history 

- history can be queried by using


| Alias | Command              | Description                                                      |
|-------|----------------------|------------------------------------------------------------------|
| `h`   | `history`            | Prints your command history                                      |
| `hl`  | `history \| less`    | Pipe history output to less to search and navigate it easily     |
| `hs`  | `history \| grep`    | Use grep to search your command history                          |
| `hsi` | `history \| grep -i` | Use grep to do a case-insensitive search of your command history |

### Aitoswitch virtualenv 

- will be used to automatically enable / disable python virtual enviroments.
- cann be also be used to create the venv for a project with a pyproject.toml or requirements.txt .

For the commands look [here](https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv?tab=readme-ov-file#commands).


| Command              | Description                                                                                     |
|----------------------|-------------------------------------------------------------------------------------------------|
| `mkvenv`             | Setup a new python project                                                                      |
| `rmvenv`             | Removes the virtual enviroment.                                                                 |
| `disable_autoswitch_virtualenv` | Temprorarily disable switching when moving between directories |
| `enable_autoswitch_virtualenv`  | Enable back the automatic switching

# Normal Mode 
- Delete charackter under cursor: x 


## vim motions and commands
in vim there are commands/ motions which can group different functionalities 
they have this layout:

[operator](operator)

[motion](navigation)
for exaple 
d - is the delete operator 
w - is the motion what will be operated on (delete the current word)

### Motions for navigating the cursor
- to start of next word: w
- to end of current word: e
- to the end of the current line: $
- to the start of the current line: 0
then we cann also de which will delete all from the cursor to the end of the line


using the motions without an operator the cursor will move corresponding

### Count for motions 

- tyoing a number before a motion repeats it this amount of times 

- Example: 22w jumps 22 words

### Deletion 
- to open delete options type: d
- delete a word: dw
    cursor needs to be at the begining of the word
- delete end of line: d$
- 
### Undo 
- undo last command: u
- undo whole line: U


### Put command 
conten from a nvim register can be out in put to the file with 
- p : puts the content after the cursor
- P : puts the content before the cursor 

### replace command 
as the name sugest replacing thing with tuhings
- characters can be replaced py typing 
- rh : after r type the key thaht the cursor should be replaced with
- R : activate replace mode for multiple replacmenets

### Change operator 
- change until cann be invoked by c 
let the things be gahged which are wanted , it deletes 

### Jumpung around in the file 

- to bottom of file: G
- to top of file: gg
- jump to line: line_no G 

### Searching in file 
searching forward put /
searching backwards put ?

 go back to where i came form CTRL o
go forward CTRL ij 

you can also ignore things 

### Jumoing between brackets 
simply on a bracket use % to jump to the correspending bracker 

### Open command 
o opens a new line below the cursor 

### yanking ( copy pasta)

- text can be copied by using y
- or use the visual mode to select text and then use y 
- pasing uses p 



# Insert Mode 
- mode for editing text 
- enter insert with: i 
    allows insertion before the cursor
- enter appedn with: a
    allows inserion after the cursor
- appent text after the line: A


## Saving and quiting a file

- exiting neovim: :q
- saving a file and quit: :wq



## Neo tree
explorer can be opened with <c-b>

in the explorer you can use the following keys

- a : create new file 
- A : create new folder
- r : rename 
- d : delete



## Autocompletion
- Scroll hint doc -4
    <C-b>
- Scroll hint doc +4
    <C-
- Show help text
    <leader-h>


### Load config

- needed requiremnts tpm to install

Repo config file: tmux.conf  
Default tmux config path: ~/.tmux.conf

Options:

1. Copy
```bash
cp tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

2. Symlink (inside this repo directory)
```bash
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
tmux source-file ~/.tmux.conf
```

3. Start tmux with explicit file
```bash
tmux -f tmux.conf
```

Reload in a running session (Prefix r = C-s then r):
```bash
tmux source-file ~/.tmux.conf
```

Verify config file / symlink:
```bash
ls -l ~/.tmux.conf
```





### Windows 

- Window are high lying are 


- Create window 
    <leader-c>
- close current window 
    <leader-&>
- list windows
    <leader-w>
- previous window 
    <leader-p>
- next window 
    <leader-n>
- select window by number 
    <leader-window_number>



### Panes 

- lower than a windows there can be multiple withn a  window

- split current pane vertical 
    <leader-%>
- split current pane horizontal 
    <leader-">
## JQ Json formatter 
to formatt json use 
:%!jq .

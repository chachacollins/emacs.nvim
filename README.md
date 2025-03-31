# Emacs.nvim

This is a plugin that adds keybindings for emacs in neovim insert mode.

Now I know what you're thinking, why the fuck would you just not use emacs then and I hear you. The reason why is because I have free will and I also think it's pretty funny.

The real reason though is because sometimes I need to do a simple operation that would need me to go into insert mode. Fuck that I'm too lazy, I'll just use emacs bindings and then use neovim bindings when I actually need to navigate the code.

> [!WARNING]
> If for some ungodly reason you stumbled upon this repo I just want you to know that this is not full emacs emulation, only the commands I can remember off the top of my head.

> [!NOTE]
> I will not be fixing any bugs.

## Features

- Basic emacs movement in insert mode (C-b, C-f, C-a, C-e)
- Kill line (C-k)
- Delete forward/backward (C-d, C-h)
- Word movement (M-f, M-b)
- Word deletion (M-d, M-BS)
- Move to indentation (M-m)
- Command mode equivalents for all of the above

## Installation

```lua
-- Using packer
use 'chachacollins/emacs.nvim'

-- Using lazy.nvim
{
  'chachacollins/emacs.nvim',
}
```

## Usage

This plugin works out of the box once installed. No configuration needed.

## License

Do whatever the fuck you want with this code [license](./LICENSE).

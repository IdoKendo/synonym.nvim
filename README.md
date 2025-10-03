# synonym.nvim

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Phil Karlton once said "There are only two hard things in Computer Science:
cache invalidation and naming things."

While I can't help you with cache invalidation, synonym.nvim attempts to help
with naming things.

Invoking this plugin while hovering over a variable will query a dictionary and suggest synonyms.
Selecting one will rename the variable and all its usages using the LSP.

## Features

- Suggest synonyms for variables using an online dictionary
- Rename variables and their usages seamlessly with LSP integration
- Telescope picker for easy synonym selection

## Requirements

- Neovim >= 0.8.0
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- An LSP server configured for your language

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
    "IdoKendo/synonym.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "grs", function() require("synonym").find_synonym() end, desc = "[G]oto [R]ename [S]ynonym" },
    },
}
```

## Usage

1. Place your cursor on a variable in your code.
2. Run `:lua require("synonym").find_synonym()` or use the configured keymap (default: `grs`).
3. A Telescope picker will open with synonym suggestions.
4. Select a synonym to rename the variable and all its references using LSP.

## Configuration

No additional configuration is required. The plugin works out of the box with the default settings.

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# synonym.nvim

Phil Karlton once said "There are only two hard things in Computer Science:
cache invalidation and naming things."

While I can't help you with cache invalidation, synonym.nvim attempts to help
with naming things.

Invoking this plugin while hovering over a variable will go to a dictionary
and will suggest all synonyms from the dictionary. Selecting one will rename
the variables and its usages using the LSP.

## Installation
Using lazy.nvim:
```lua
{
    "IdoKendo/synonym.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { "<leader>vrs", function() require("synonym").find_synonym() end, desc = "[V]isual [R]ename [S]ynonym" },
    },
}

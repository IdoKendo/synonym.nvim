# synonym.nvim

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

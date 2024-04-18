local Job = require("plenary.job")
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local config = require("telescope.config").values
local finders = require("telescope.finders")
local log = require("plenary.log").new({ plugin = "synonym.nvim", level = "info" })
local pickers = require("telescope.pickers")

local M = {}

M.find_synonym = function(opts)
    local word = vim.fn.expand("<cword>")
    local url = "https://api.dictionaryapi.dev/api/v2/entries/en/" .. word
    log.info("constructed url", url)
    local synonyms = {}
    local job = Job:new({
        command = "curl",
        args = { url },
        on_exit = function(j, return_val)
            log.info("ret val", return_val)
            local meanings = vim.json.decode(j:result()[1])[1].meanings
            for _, meaning in pairs(meanings) do
                for _, v in ipairs(meaning.synonyms) do
                    local synonym = string.gsub(v, " ", "_")
                    synonym = string.gsub(synonym, "'", "")
                    table.insert(synonyms, synonym)
                end
            end
        end,
    })
    job:start()
    job:wait(2000, 1)
    log.info("gotten synonyms", vim.json.encode(synonyms))
    if next(synonyms) == nil then
        vim.notify("No synonyms for " .. word)
        return
    end
    pickers
        .new(opts, {
            finder = finders.new_table({
                results = synonyms,
                entry_maker = function(entry)
                    return {
                        value = entry,
                        display = entry,
                        ordinal = entry,
                    }
                end,
            }),
            sorter = config.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                    local selection = action_state.get_selected_entry()
                    actions.close(prompt_bufnr)
                    log.info("selection", selection.value)
                    vim.lsp.buf.rename(selection.value)
                end)
                return true
            end,
        })
        :find()
end

return M

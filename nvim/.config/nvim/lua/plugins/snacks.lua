local function read_header(filepath)
  local lines = vim.fn.readfile(filepath)
  if vim.tbl_isempty(lines) then
    return ""
  end
  return table.concat(lines, "\n")
end

local banner_cmd = [[
(head -c $(tput cols) < /dev/zero | tr "\0" "=" | lolcat -f -p 1) && (figlet $(whoami) | while IFS= read -r line; do printf "%*s%s\n" $(( ( $(tput cols) - ${#line} ) / 2 )) "" "$line"; done | lolcat -f -a -p 1) && (head -c $(tput cols) < /dev/zero | tr "\0" "=" | lolcat -f -a -p 1)
]]

---@class snacks.dashboard.Config
local dashboard_opts = {
  enabled = true,

  preset = {
    keys = {
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
    header = read_header(vim.fn.stdpath("config") .. "/header.txt"),
  },

  ---@param opts { width: integer, height: integer }
  sections = function(opts)
    local width = opts.width or vim.o.columns
    local sections = {}

    local pane_1 = {
      { pane = 1, section = "header" },
      { pane = 1, section = "keys", gap = 1, padding = 1 },
      { pane = 1, section = "startup" },
    }
    local pane_2 = {
      {
        pane = 2,
        section = "terminal",
        cmd = banner_cmd,
        auto_close = true,
      },
      {
        pane = 2,
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          icon = " ",
          title = "Git Status",
          section = "terminal",
          indent = 3,
          padding = 1,
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          ttl = 5 * 60,
        },
      },
    }

    table.insert(sections, pane_1)
    table.insert(sections, pane_2)
    return sections
  end,
}

---@class snacks.indent.Config
local indent_opts = { chunk = { enabled = true } }
local indent_hl = function()
  vim.api.nvim_set_hl(0, "SnacksIndent", { link = "Conceal" })
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { link = "Special" })
  vim.api.nvim_set_hl(0, "SnacksIndentChunk", { link = "SnacksIndentScope" })
end

vim.api.nvim_set_hl(0, "", { link = "" })
local picker_hl = function()
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatus", { link = "Special" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusAdded", { link = "GitSignsAdd" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusDeleted", { link = "GitSignsDelete" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusModified", { link = "GitSignsChange" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusRenamed", { link = "GitSignsStagedAdd" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusCopied", { link = "GitSignsAdd" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "GitSignsUntracked" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { link = "Conceal" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUnmerged", { link = "DiagnosticError" })
  vim.api.nvim_set_hl(0, "SnacksPickerGitStatusStaged", { link = "GitSignsStagedChange" })
  vim.api.nvim_set_hl(0, "SnacksPickerTree", { link = "Comment" })
end

return {
  {
    "snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = dashboard_opts

      opts.indent = indent_opts
      indent_hl()

      picker_hl()
      return opts
    end,
  },
}

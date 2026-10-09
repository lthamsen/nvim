return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    keys = {
      { "<leader>on", "<cmd>Obsidian new_from_template<cr>", desc = "New note from template" },
      { "<leader>oo", "<cmd>Obsidian quick_switch<cr>",      desc = "Find note" },
      { "<leader>os", "<cmd>Obsidian search<cr>",            desc = "Search notes" },
      { "<leader>ob", "<cmd>Obsidian backlinks<cr>",         desc = "Backlinks" },
      { "<leader>ot", "<cmd>Obsidian today<cr>",             desc = "Today's daily note" },
      { "<leader>oT", "<cmd>Obsidian template<cr>",          desc = "Insert template" },
    },
    opts = {
      legacy_commands = false,
      workspaces = {
        { name = "notes", path = "~/vault" },
      },

      -- New notes land in the inbox
      notes_subdir = "inbox",
      new_notes_location = "notes_subdir",

      -- Readable filenames: "My Note" -> my-note.md
      note_id_func = function(title)
        if title ~= nil and title ~= "" then
          return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        end
        return tostring(os.time())
      end,

      daily_notes = {
        folder = "daily",
        date_format = "%Y-%m-%d",
        template = "daily.md",
      },
      templates = {
        folder = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {
          date = function()
            return os.date("%Y-%m-%d")
          end,
        },
      },

      attachments = {
        folder = "assets",
      },

      -- render-markdown handles rendering
      ui = { enable = false },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    keys = {
      { "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", ft = "markdown", desc = "Toggle markdown rendering" },
    },
    opts = {
      -- Show raw markdown when toggled off (global conceallevel=1 otherwise hides syntax)
      win_options = { conceallevel = { default = 0 } },
    },
  },
  {
    -- Live preview in the browser (renders mermaid too)
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = "cd app && npm install",
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown preview (browser)" },
    },
  },
}

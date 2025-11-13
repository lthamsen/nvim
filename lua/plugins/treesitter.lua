return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- needed for move/select/swap
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    opts = function(_, opts)
      -- --- ensure_installed: append without duplicating
      local function add(list, items)
        list = list or {}
        local seen = {}
        for _, v in ipairs(list) do
          seen[v] = true
        end
        for _, v in ipairs(items) do
          if not seen[v] then
            table.insert(list, v)
          end
        end
        return list
      end

      opts.ensure_installed = add(opts.ensure_installed, {
        "ocaml",
        "ocaml_interface",
        "menhir",
        -- optional but handy for this setup:
        "markdown",
        "markdown_inline",
      })

      -- --- textobjects: merge your block/cell mappings
      opts.textobjects = opts.textobjects or {}

      opts.textobjects.move = vim.tbl_deep_extend("force", opts.textobjects.move or {}, {
        enable = true,
        set_jumps = false, -- keep your preference
        goto_next_start = vim.tbl_deep_extend(
          "force",
          opts.textobjects.move and opts.textobjects.move.goto_next_start or {},
          {
            ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
          }
        ),
        goto_previous_start = vim.tbl_deep_extend(
          "force",
          opts.textobjects.move and opts.textobjects.move.goto_previous_start or {},
          {
            ["[b"] = { query = "@code_cell.inner", desc = "previous code block" },
          }
        ),
      })

      opts.textobjects.select = vim.tbl_deep_extend("force", opts.textobjects.select or {}, {
        enable = true,
        lookahead = true,
        keymaps = vim.tbl_deep_extend("force", opts.textobjects.select and opts.textobjects.select.keymaps or {}, {
          ["ib"] = { query = "@code_cell.inner", desc = "in block" },
          ["ab"] = { query = "@code_cell.outer", desc = "around block" },
        }),
      })

      opts.textobjects.swap = vim.tbl_deep_extend("force", opts.textobjects.swap or {}, {
        enable = true,
        swap_next = vim.tbl_deep_extend(
          "force",
          opts.textobjects.swap and opts.textobjects.swap.swap_next or {},
          { ["<leader>sbl"] = "@code_cell.outer" }
        ),
        swap_previous = vim.tbl_deep_extend(
          "force",
          opts.textobjects.swap and opts.textobjects.swap.swap_previous or {},
          { ["<leader>sbh"] = "@code_cell.outer" }
        ),
      })

      -- your custom highlight
      vim.api.nvim_set_hl(0, "qtest", { link = "SpecialComment" })
    end,
  },
}

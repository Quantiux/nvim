local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
  vim.notify("nvim-neorg plugin not loaded!")
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},         -- load all default modules
    ["core.integrations.telescope"] = {},   -- enable telescope module
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Documents/Notes",
        },
        autochdir = true,           -- automatically start in root directory
        index = "index.norg",       -- name of root .norg file
      }
    },
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>n"
      }
    },
    ["core.norg.concealer"] = {
      config = {
        dim_code_blocks = {
          enabled = true,
          width = "content",            -- "fullwidth"(default)/"content"
          padding = {
            right = 2,
          },
          conceal = true,               -- default
        },
        markup_preset = "conceal",      -- "conceal"/"dimmed"/"varied"
        icon_preset = "diamond",
        icons = {
          todo = {
            enabled = true,
            done = {
              enabled = true,
              icon = "",
              highlight = "NeorgTodoItemDoneMark",
              padding_before = 0,
            },
            pending = {
              enabled = true,
              icon = "",
              highlight = "NeorgTodoItemPendingMark",
              padding_before = 0,
            },
            undone = {
              enabled = true,
              icon = "×",
              highlight = "TSComment",
              padding_before = 0,
            },
            uncertain = {
              enabled = true,
              icon = "?",
              padding_before = 0,
            },
            urgent = {
              enabled = true,
              icon = "",
              padding_before = 0,
            },
            on_hold = {
              enabled = true,
              icon = "",
              padding_before = 0,
            },
            cancelled = {
              enabled = true,
              icon = "",
              padding_before = 0,
            },
          },
          quote = {
            enabled = true,
            icon = "∣",
            highlight = "NeorgQuote",
            padding_before = 0,
          },
          heading = {
            enabled = true,
            level_1 = {
              enabled = true,
              icon = "◉",
              highlight = "NeorgHeading1",
            },
            level_2 = {
              enabled = true,
              icon = " ○",
              highlight = "NeorgHeading2",
            },
            level_3 = {
              enabled = true,
              icon = "  ✿",
              highlight = "NeorgHeading3",
            },
            level_4 = {
              enabled = true,
              icon = "   •",
              highlight = "NeorgHeading4",
            },
          },
          marker = {
            enabled = true,
            icon = "",
            highlight = "NeorgMarker",
            padding_before = 0,
          },
        }
      }
    },
  },
  logger = {
    level = "warn"                     -- trace/info/warn/error/fatal
  }
}

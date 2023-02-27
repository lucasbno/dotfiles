      require("catppuccin").setup {
          transparent_background = false,
          term_colors = false,
          dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
          },
          no_italic = false, -- Force no italic
          no_bold = false, -- Force no bold
          styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
          },
          color_overrides = {
              mocha = {
                  base = "#090B0D",
                  crust = "#090B0D",
                  mantle = "#090B0D",
              },
              frappe = {},
              macchiato = {},
              latte = {},
          },
          custom_highlights = {},
          integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              telescope = true,
              notify = false,
              mini = false,
              -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
          },
      }

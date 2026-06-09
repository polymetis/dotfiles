-- tokyonight + Operator Mono cursive italics.
--
-- The cursive itself comes from the terminal (Ghostty) rendering italic-marked
-- text in Operator Mono's "Book Italic" face. This file decides *what* gets
-- marked italic, mirroring the VS Code tokenColorCustomizations:
--   meta.module.elixir            -> italic      (@module)
--   keyword.control.elixir        -> italic      (covered by styles.keywords)
--   keyword.other.special-method  -> italic      (def/defp & friends, via keywords)
--   comment.documentation.heredoc -> NOT italic  (@doc / @moduledoc strings)
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- matches Ghostty's "TokyoNight Night" + the starship palette
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      on_highlights = function(hl, _colors)
        -- Italic flourishes for module/namespace names.
        hl["@module"] = { italic = true }
        hl["@lsp.type.namespace"] = { italic = true }
        -- Keep documentation heredocs upright (matches the VS Code override).
        hl["@string.documentation"] = { italic = false }
        hl["@comment.documentation"] = { italic = false }
      end,
    },
  },
  -- Make tokyonight the active colorscheme (LazyVim's default, set explicitly).
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
}

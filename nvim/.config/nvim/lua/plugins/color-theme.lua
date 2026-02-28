return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("themery").setup({
        themes = {
          { name = "TokyoDark",    colorscheme = "tokyodark" },
          { name = "Carbonfox",    colorscheme = "carbonfox" },
          { name = "Dawnfox",      colorscheme = "dawnfox" },
          { name = "Gruvbox",      colorscheme = "gruvbox" },
          { name = "Nord",         colorscheme = "nord" },
          { name = "Catppuccin",   colorscheme = "catppuccin-mocha" },
         },
        livePreview = true,
      })

    end,
  },
  { "tiagovla/tokyodark.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "shaunsingh/nord.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
}


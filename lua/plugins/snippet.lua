return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Define custom snippets
      local luasnip = require("luasnip")

      -- Custom snippet: console.log() with warning
      luasnip.snippet({
        trig = "clg",
        name = "console.log() with warning",
      }, {
        luasnip.text("//WARN: log remove\nconsole.log()"),
      })
    end,
  },
}

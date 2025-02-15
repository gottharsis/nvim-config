return {
    'L3MON4D3/LuaSnip',
    version = "v2.*",
    dependencies = {'rafamadriz/friendly-snippets', },
    lazy = true,
    config = function(_, opts)
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_snipmate").lazy_load()
        require("luasnip.loaders.from_lua").lazy_load()
    end
}

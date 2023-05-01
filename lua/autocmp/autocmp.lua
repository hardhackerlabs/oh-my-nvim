local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
      --border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
      --winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      --max_width = 120,
      --min_width = 60,
      --max_height = math.floor(vim.o.lines * 0.3),
      --min_height = 1,
  },
  formatting = {
    format = require('lspkind').cmp_format({
      mode = "symbol_text", -- options: "text_symbol" | "symbol_text"
      menu = ({
        buffer        = "[Buffer]",
        nvim_lsp      = "[LSP]",
        nvim_lua      = "[Lua]",
        path          = "[Path]",
        treesitter    = "[Tree]",
      })
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'nvim_lua' },
  }, {
    { name = 'path' },
    { name = 'buffer' },
    { name = 'calc' }
  }),
})

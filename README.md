# nvim-leptos-snippets

LuaSnip snippets for [Leptos](https://leptos.dev/) 0.8+ development in Neovim.

## Installation

### lazy.nvim
```lua
{
  'L3MON4D3/LuaSnip',
  dependencies = {
    {
      'lovenangelo/nvim-leptos-snippets',
      config = function()
        require('snippets.nvim-leptos-snippets')
      end,
    },
  },
}
```

### packer.nvim
```lua
use {
  'L3MON4D3/LuaSnip',
  requires = {
    {
      'lovenangelo/nvim-leptos-snippets',
      config = function()
        require('snippets.nvim-leptos-snippets')
      end,
    },
  },
}
```

## Snippets

| Trigger | Description |
|---------|-------------|
| `lcomponent` | Basic component |
| `lcompprops` | Component with props |
| `lsignal` | Signal |
| `lrwsignal` | RwSignal |
| `lresource` | Resource for async data |
| `lserver` | Server function |
| `laction` | Action |
| `lfor` | For loop component |
| `lshow` | Show component |
| `lsuspense` | Suspense boundary |
| `leffect` | Effect |
| `lmemo` | Memo |
| `lonclick` | onClick handler |
| `lprovide` | Provide context |
| `luse` | Use context |
| `lnoderef` | NodeRef |
| `llazy` | Lazy component |

## Navigation

Add this keybindings in your configuration if navigation doesn't work

```
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
  if require('luasnip').jumpable(1) then
    require('luasnip').jump(1)
  else
    return '<Tab>'
  end
end, { expr = true, silent = true })

vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
  if require('luasnip').jumpable(-1) then
    require('luasnip').jump(-1)
  end
end, { silent = true })

```
## Requirements

- Neovim >= 0.9
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)

## License

MIT

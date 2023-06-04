-- Interactive real time neovim scratchpad for embedded lua engine
return {
  {
    "rafcamlet/nvim-luapad",
    cmd = { "Luapad", "LuaRun" },
    config = function()
      require("luapad").setup({
        wipe = false,
      })
    end,
  },
}

-- Interactive real time neovim scratchpad for embedded lua engine
return {
  {
    "rafcamlet/nvim-luapad",
    cmd = { "Luapad", "LuaRun" },
    name = "luapad",
    opts = {
      wipe = false,
    },
  },
}

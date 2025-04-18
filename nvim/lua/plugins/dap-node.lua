-- ~/.config/nvim/lua/plugins/dap-node.lua
return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "node-debug2-adapter",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")

      dap.configurations.javascript = {
        {
          name = "Launch file (JS)",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
        },
        {
          name = "Attach to running process (JS)",
          type = "pwa-node",
          request = "attach",
          port = 9229,
          restart = false,
          address = "127.0.0.1",
          localRoot = vim.fn.getcwd(), -- where your code is
          remoteRoot = nil, -- leave nil if it's local
        },
      }
      dap.configurations.typescript = {
        {
          name = "Attach to running process (TS)",
          type = "pwa-node",
          request = "attach",
          port = 9229, -- The port your Node.js process is listening to
          localRoot = "${workspaceFolder}/src", -- Your TypeScript source code
          remoteRoot = "${workspaceFolder}/dist", -- The compiled JavaScript
          sourceMaps = true, -- Enable source maps for TypeScript debugging
          resolveSourceMapLocations = {
            "${workspaceFolder}/**", -- Make sure it resolves to your src
            "!**/node_modules/**", -- Exclude node_modules
          },
          skipFiles = { "<node_internals>/**", "node_modules/**" },
          protocol = "inspector", -- Debugger protocol
        },
      }
    end,
  },
}

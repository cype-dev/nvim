return {
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    cmd = { 'ChatGPT', 'ChatGPTActAs', 'ChatGPTEditWithInstruction', 'ChatGPTRun' },
    keys = {
          { '<Leader>cc', "<cmd>ChatGPT<CR>",                              desc = "ChatGPT" },
          { '<Leader>ce', "<cmd>ChatGPTEditWithInstruction<CR>",           desc = "Edit with instruction",     mode = { "n", "v" } },
          { '<Leader>cg', "<cmd>ChatGPTRun grammar_correction<CR>",        desc = "Grammar Correction",        mode = { "n", "v" } },
          { '<Leader>ct', "<cmd>ChatGPTRun translate<CR>",                 desc = "Translate",                 mode = { "n", "v" } },
          { '<Leader>ck', "<cmd>ChatGPTRun keywords<CR>",                  desc = "Keywords",                  mode = { "n", "v" } },
          { '<Leader>cd', "<cmd>ChatGPTRun docstring<CR>",                 desc = "Docstring",                 mode = { "n", "v" } },
          { '<Leader>ca', "<cmd>ChatGPTRun add_tests<CR>",                 desc = "Add Tests",                 mode = { "n", "v" } },
          { '<Leader>co', "<cmd>ChatGPTRun optimize_code<CR>",             desc = "Optimize Code",             mode = { "n", "v" } },
          { '<Leader>cs', "<cmd>ChatGPTRun summarize<CR>",                 desc = "Summarize",                 mode = { "n", "v" } },
          { '<Leader>cf', "<cmd>ChatGPTRun fix_bugs<CR>",                  desc = "Fix Bugs",                  mode = { "n", "v" } },
          { '<Leader>cx', "<cmd>ChatGPTRun explain_code<CR>",              desc = "Explain Code",              mode = { "n", "v" } },
          { '<Leader>cr', "<cmd>ChatGPTRun roxygen_edit<CR>",              desc = "Roxygen Edit",              mode = { "n", "v" } },
          { '<Leader>cl', "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis", mode = { "n", "v" } },
    },
    opts = {
      api_key_cmd = 'pass development/chatgpt_authkey'
    }
  }
}

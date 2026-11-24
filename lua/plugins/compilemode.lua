vim.pack.add({'https://github.com/ej-shafran/compile-mode.nvim'})

---@type CompileModeOpts
vim.g.compile_mode = {
    input_word_completion = true,
    default_command = {
        c = "cc -o %:r % && ./%:r",
        cpp = "c++ -std=c++23 -o %:r % && ./%:r", -- `cc` doesn't link libstdc++
        python = "python %",
    },
    focus_compilation_buffer = true
}

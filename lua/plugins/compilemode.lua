return {
    'ej-shafran/compile-mode.nvim',
    version = '^5.0.0',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            input_word_completion = true,
            default_command = {
                c = "cc -o %:r % && ./%:r",
                cpp = "cc -std=c++23 -o %:r % && ./%:r",
                python = "python %",
            },
            focus_compilation_buffer = true
        }
    end
}

return {
    'ej-shafran/compile-mode.nvim',
    version = '^5.0.0',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    cmd = 'Compile',
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            input_word_completion = true,
            default_command = {
                --c = "cc -o %:r % && ./%:r",
                --cpp = "cc -std=c++23 -o %:r % && ./%:r",
                c = "make -k",
                cpp = "make -k",
                python = "python main",
                go = "go run .",
            },
            focus_compilation_buffer = true
        }
    end
}

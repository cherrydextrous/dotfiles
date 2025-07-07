local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },

    formatters = {
        -- C & C++
         ["clang-format"] = {
             prepend_args = {
                 "-style={ \
                         IndentWidth: 2, \
                         TabWidth: 2, \
                         UseTab: Never, \
                         AccessModifierOffset: 0, \
                         IndentAccessModifiers: true, \
                         PackConstructorInitializers: Never}",
             },
         },
         -- Lua
         stylua = {
             prepend_args = {
                 "--column-width", "80",
                 "--line-endings", "Unix",
                 "--indent-type", "Spaces",
                 "--indent-width", "2",
                 "--quote-style", "AutoPreferDouble",
             },
         },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

require("conform").setup(options)

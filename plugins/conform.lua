return {
    "stevearc/conform.nvim",
    opts = function(_, opts)
        -- Function to check if .clang-format exists in root
        local function has_clang_format()
            local root = vim.fn.getcwd()
            return vim.fn.filereadable(root .. "/.clang-format") == 1
        end

        -- Configure formatters for C/C++ files
        opts.formatters_by_ft = opts.formatters_by_ft or {}
        opts.formatters_by_ft.c = function()
            if has_clang_format() then
                return { "clang-format" }
            end
            return {}
        end
        opts.formatters_by_ft.cpp = function()
            if has_clang_format() then
                return { "clang-format" }
            end
            return {}
        end
        opts.formatters_by_ft.h = opts.formatters_by_ft.c
        opts.formatters_by_ft.hpp = opts.formatters_by_ft.cpp

        return opts
    end,
}

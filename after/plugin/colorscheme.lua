require("gruvbox").setup({
    invert_selection = true,
    invert_signs = true,
    invert_tabline = true,
    invert_intend_guides = true,
    contrast = "hard",              -- can be "hard", "soft" or empty string
    palette_overrides = {
        bright_red = "#66d9ef",     -- def/case/do/end
        bright_green = "#a6e22e",   -- function name
        bright_purple = "#ff457b",  -- module name
        neutral_purple = "#d068eb", -- numbers
        bright_blue = "#ffaf68",    -- :atom/token:
        neutral_blue = "#07a9b0",   -- true/false
        bright_yellow = "#e6db74",  -- strings
        faded_red = "#ebdbb2",      -- arguments
        light1 = "#ffffff"          -- method calls
    },
    overrides = {
        Macro = { link = "GruvboxFg1" },
        String = { fg = "#e6db74", italic = true },
        Boolean = { link = "GruvboxNeutralBlue" },
        Number = { link = "GruvboxNeutralPurple" },
        Float = { link = "GruvboxNeutralPurple" },
        Delimiter = { link = "GruvboxFg1" },
        ["@function.call"] = { link = "Macro" },
        ["@variable"] = { link = "GruvboxFadedRed" },
        ["@module"] = { link = "GruvboxPurple" },
    },
    transparent_mode = false,
})

vim.cmd('colorscheme gruvbox')

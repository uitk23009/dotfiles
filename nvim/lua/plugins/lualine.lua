return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
			},
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 2
                    }
                }
            }
		})
	end,
}
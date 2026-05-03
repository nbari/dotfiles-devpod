return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
        local notify = require("notify")
        notify.setup {
            top_down = false,
            stages = "fade_in_slide_out",
            timeout = 3000
        }

        vim.notify = notify

        vim.keymap.set("n", "<leader>,", function()
            notify.dismiss()
        end, {
            desc = "Dismiss notification"
        })
    end
}

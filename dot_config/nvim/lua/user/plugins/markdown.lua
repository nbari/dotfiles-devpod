-- cd markdown-preview.nvim
-- pnpm install tslib
-- pnpm install
-- pnpm build
return {
    "iamcco/markdown-preview.nvim",
    cmd = {
        "MarkdownPreviewToggle",
        "MarkdownPreview",
        "MarkdownPreviewStop"
    },
    ft = {
        "markdown"
    },
    build = "cd app && ./install.sh"
}

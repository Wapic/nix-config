{ pkgs, lib, ... }: {
    home.packages = with pkgs; [
        typescript-language-server
        bash-language-server
        lua-language-server
        pyright
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        plugins = with pkgs.vimPlugins; [
            fzf-vim
            coq_nvim
            coq-artifacts
            coq-thirdparty
            lualine-nvim
            onedark-nvim
            chadtree
            nvim-treesitter
            nvim-lspconfig
            nvim-treesitter-parsers.c
            nvim-treesitter-parsers.lua
            nvim-treesitter-parsers.markdown
            nvim-treesitter-parsers.bash
            nvim-treesitter-parsers.cpp
            nvim-treesitter-parsers.json
            nvim-treesitter-parsers.python
            nvim-treesitter-parsers.rust
            nvim-treesitter-parsers.toml
            nvim-treesitter-parsers.javascript
            nvim-treesitter-parsers.html
            nvim-treesitter-parsers.nix
            nvim-treesitter-parsers.yaml
            nvim-treesitter-parsers.typescript
            nvim-treesitter-parsers.ssh_config
            nvim-treesitter-parsers.desktop
            nvim-treesitter-parsers.css
        ];

        extraLuaConfig = ''
            vim.opt.number = true
            vim.opt.relativenumber = true
            vim.opt.expandtab = true
            vim.opt.shiftwidth = 4
            vim.opt.tabstop = 4
            vim.opt.softtabstop = 4
            vim.keymap.set("n", "<Space>", "<Nop>", {silent = true})
            vim.g.mapleader = " "

            vim.keymap.set("n", "<C-o>", "<cmd>CHADopen<cr>")
            vim.keymap.set("n", "<C-a>", "<ESC>^")
            vim.keymap.set("n", "<C-e>", "<ESC>$")
            vim.keymap.set("n", "<C-v>", '"+p')
            vim.keymap.set("n", "<C-r>", "<cmd>call fzf#run(fzf#wrap({ 'options' : ['--preview', 'bat --color=always {}']}))<cr>")

            vim.keymap.set("v", "<C-c>", '"+y<cr>')

            vim.g.coq_settings = {
                auto_start = "shut-up",
                xdg = true,
            }

            local onedark = require "onedark"
            local lualine = require "lualine"

            onedark.setup {
                style = "darker",
            }
            
            vim.cmd("colorscheme onedark")
            lualine.setup({
                options = {
                    theme = "auto",
                },
            })

            local treesitter = require "nvim-treesitter.configs"

            treesitter.setup({
                parser_install_dir = "~/.config/nvim/tree-sitter",

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })

            local lsp = require "lspconfig"
            local coq = require "coq"

            lsp.ts_ls.setup(coq.lsp_ensure_capabilities({}))
            lsp.pyright.setup(coq.lsp_ensure_capabilities({}))
            lsp.bashls.setup(coq.lsp_ensure_capabilities({}))
            lsp.lua_ls.setup(coq.lsp_ensure_capabilities({}))

            vim.g.fzf_layout = {
                window = {
                    width = 0.9,
                    height = 0.9,
                }
            }
        '';
    };
}

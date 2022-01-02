require ("nvim-treesitter.parsers").get_parser_configs().haxe = {
  install_info = {
    url = "~/Source/tree-sitter-haxe", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "hx", -- if filetype does not agrees with parser name
  used_by = {"hxs"} -- additional filetypes that use this parser
}

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true
  }
}

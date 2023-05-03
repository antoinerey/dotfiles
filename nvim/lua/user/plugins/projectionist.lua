vim.g.projectionist_heuristics = {
  ['tsconfig.json'] = {
    ['*.test.ts'] = { alternate = { '{}.ts', '{}.vue' } },
    ['*.ts'] = { alternate = '{}.test.ts' },
    ['*.vue'] = { alternate = '{}.test.ts' },
  }
}

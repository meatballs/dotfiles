return {
  settings = {
    basedpyright = {
      disableLanguageServices = true,
      disableOrganizeImports = true,
      disableTaggedHints = true,
      analysis = {
        diagnosticSeverityOverrides = {
          reportUnusedVariable = false,
          reportUndefinedVariable = false,
        },
      },
    },
  },
}

local jdtls_ok, jdtls = pcall(require, 'jdtls')
if not jdtls_ok then
	return
end

local HOME = os.getenv 'HOME'
local JDTLS_LOCATION = HOME .. '/.local/share/jdtls'
local WORKSPACE_PATH = HOME .. '/.cache/java/'

local project_name = vim.fn.fnamemodify( vim.fn.getcwd(), ':p:h:t')
local workspace_dir = WORKSPACE_PATH .. project_name

-- local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }

-- local root_dir = require('jdtls.setup').find_root(root_markers)
-- if root_dir == '' then
--	return
-- end

local exCapabilities = jdtls.extendedClientCapabilities
exCapabilities.resolveAdditionalTextEditSupport = true

local config = {
	cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"),
    "-configuration",
    JDTLS_LOCATION .. "/config_linux",
    "-data",
    workspace_dir,
  },
	settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = exCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
}

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')

if not lspconfig_status_ok then
	return
end

lspconfig['jdtls'].setup(config)

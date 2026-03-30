{
  "files.exclude" = {
    "**/node_modules" = true;
  };
  "workbench.editor.enablePreviewFromQuickOpen" = false;
  "editor.formatOnSave" = true;
  "security.workspace.trust.untrustedFiles" = "open";
  "extensions.experimental.affinity" = {
    "vscodevim.vim" = 1;
    "asvetliakov.vscode-neovim" = 1;
  };
  "vim.statusBarColorControl" = false;
  "vim.useSystemClipboard" = true;
  "vim.hlsearch" = true;
  "vim.leader" = "<space>";
  "vim.normalModeKeyBindingsNonRecursive" = [
    {
      before = [ "leader" "p" ];
      commands = [ "reactpreview.open" ];
    }
    {
      before = [ "leader" "w" ];
      commands = [ "workbench.action.files.save" ];
    }
    {
      before = [ "leader" "g" "g" ];
      commands = [ "git-graph.view" ];
    }
    {
      before = [ "leader" "g" "d" ];
      commands = [ "git.openChange" ];
    }
    {
      before = [ "leader" "g" "c" ];
      commands = [ "git.checkout" ];
    }
    {
      before = [ "leader" "g" "s" ];
      commands = [ "git.stash" ];
    }
    {
      before = [ "leader" "g" "p" ];
      commands = [ "git.pull" ];
    }
    {
      before = [ "leader" "s" ];
      after = [ "leader" "leader" "s" ];
    }
    {
      before = [ "leader" "e" "s" ];
      commands = [ "editor.emmet.action.splitJoinTag" ];
    }
    {
      before = [ "leader" "e" "e" ];
      commands = [ "editor.emmet.action.expandAbbreviation" ];
    }
    {
      before = [ "leader" "e" "d" ];
      commands = [ "editor.emmet.action.removeTag" ];
    }
    {
      before = [ "leader" "s" ];
      after = [ "leader" "leader" "s" ];
    }
    {
      before = [ "@" ];
      after = [ "V" "$" "%" ];
    }
  ];
  "vim.visualstar" = true;
  "vim.easymotion" = true;
  "vim.easymotionKeys" = "sdfghjkl;";
  "vim.easymotionMarkerForegroundColorOneChar" = "rgba(0,240,170,0.9)";
  "vim.easymotionMarkerBackgroundColor" = "";
  "vim.easymotionMarkerFontWeight" = "normal";
  "vim.whichwrap" = "h,l";
  "vim.handleKeys" = {
    "<C-w>" = false;
  };
  "[jsonc]" = {
    "editor.defaultFormatter" = "vscode.json-language-features";
  };
  "editor.minimap.enabled" = true;
  "workbench.editor.wrapTabs" = true;
  "workbench.editor.focusRecentEditorAfterClose" = false;
  "workbench.action.closeActivePinnedEditor" = false;
  "typescript.tsserver.experimental.enableProjectDiagnostics" = true;
  "[typescriptreact]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[typescript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[javascript]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[sql]" = {
    "editor.defaultFormatter" = "inferrinizzard.prettier-sql-vscode";
  };
  "[markdown]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "files.trimTrailingWhitespace" = false;
    "editor.wordWrap" = "off";
  };
  "[mdx]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
    "files.trimTrailingWhitespace" = false;
    "editor.wordWrap" = "bounded";
  };
  "typescript.updateImportsOnFileMove.enabled" = "always";
  "[yaml]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[json]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "git.enableSmartCommit" = true;
  "[html]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "javascript.updateImportsOnFileMove.enabled" = "always";
  "terminal.integrated.enableMultiLinePasteWarning" = false;
  "githubPullRequests.pullBranch" = "never";
  "[css]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "[javascriptreact]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "vscode-neovim.neovimExecutablePaths.darwin" = "/opt/homebrew/bin/nvim";
  "vscode-neovim.neovimInitVimPaths.darwin" = "/Users/yamauz/.config/nvim/init.vim";
  "cSpell.userWords" = [
    "adipiscing" "amet" "atcoder" "bindgen" "Buymeacoffee" "chakra" "chuoh"
    "cloudinary" "clsx" "codepaths" "contentful" "devkit" "easymotion" "elit"
    "esbenp" "eyecatch" "Fanclub" "flyar" "Foresta" "Frontmatter" "gtag"
    "hamesan" "harker" "hatebu" "Hatena" "Hatenabookmark" "hljs" "hoverable"
    "hygen" "itertools" "keybind" "laravel" "lastmod" "lucide" "neovim"
    "nextjs" "Noto" "nrwl" "nvim" "ogps" "oklch" "OPENAI" "overscan"
    "pageview" "pnpx" "println" "proconio" "rehype" "scroller" "Sentencify"
    "sonner" "Stockable" "storycap" "svgr" "svoc" "TOEIC" "tsbuildinfo"
    "turbopack" "turborepo" "upsert" "webp" "yamaleaks" "yamasan" "Yamauz"
  ];
  "svelte.enable-ts-plugin" = true;
  "svelte.plugin.svelte.note-new-transformation" = false;
  "[svelte]" = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
  "debug.disassemblyView.showSourceCode" = false;
  "rust-analyzer.checkOnSave" = true;
  "rust-analyzer.check.command" = "clippy";
  "editor.inlineSuggest.enabled" = true;
  "github.copilot.enable" = {
    "*" = true;
    "plaintext" = false;
    "markdown" = true;
    "scminput" = false;
    "rust" = false;
    "sql" = false;
  };
  "[python]" = {
    "editor.formatOnType" = true;
  };
  "python.formatting.provider" = "black";
  "githubPullRequests.fileListLayout" = "tree";
  "redhat.telemetry.enabled" = true;
  "workbench.colorTheme" = "GitHub Dark Default";
  "git.confirmSync" = false;
  "git.autofetch" = true;
  "workbench.iconTheme" = "vscode-icons";
  "inlineChat.showDiff" = false;
  "terminal.integrated.env.osx" = {
    "FIG_NEW_SESSION" = "1";
    "Q_NEW_SESSION" = "1";
  };
  "terminal.integrated.fontFamily" = "MesloLGM Nerd Font";
  "githubPullRequests.createOnPublishBranch" = "never";
  "typescript.inlayHints.variableTypes.enabled" = true;
  "typescript.inlayHints.propertyDeclarationTypes.enabled" = true;
  "typescript.inlayHints.parameterTypes.enabled" = true;
  "typescript.inlayHints.functionLikeReturnTypes.enabled" = true;
  "typescript.inlayHints.enumMemberValues.enabled" = true;
  "typescript.inlayHints.parameterNames.enabled" = "all";
  "workbench.colorCustomizations" = {
    "editorInlayHint.parameterBackground" = "#006400";
    "editorInlayHint.parameterForeground" = "#ffffff";
    "editorInlayHint.typeForeground" = "#ffffff";
    "editorInlayHint.typeBackground" = "#000080";
  };
  "editor.inlayHints.enabled" = "offUnlessPressed";
  "nxConsole.showNodeVersionOnStartup" = false;
  "editor.accessibilitySupport" = "off";
  "editor.codeActionWidget.includeNearbyQuickFixes" = true;
  "accessibility.voice.keywordActivation" = "inlineChat";
  "workbench.tree.enableStickyScroll" = true;
  "tailwindCSS.experimental.classRegex" = [
    [
      "cva\\(([^)]*)\\)"
      "[\"'`]([^\"'`]*).*?[\"'`]"
    ]
    [
      "cx\\(([^)]*)\\)"
      "(?:'|\"|`)([^']*)(?:'|\"|`)"
    ]
    [
      "cn\\(([^)]*)\\)"
      "(?:'|\"|`)([^']*)(?:'|\"|`)"
    ]
  ];
  "editor.quickSuggestions" = {
    "strings" = true;
  };
  "github.copilot.editor.enableAutoCompletions" = true;
  "gitlens.hovers.currentLine.over" = "line";
  "gitlens.views.scm.grouped.views" = {
    "commits" = false;
    "branches" = true;
    "remotes" = true;
    "stashes" = false;
    "tags" = true;
    "worktrees" = true;
    "contributors" = true;
    "repositories" = false;
    "searchAndCompare" = false;
    "launchpad" = false;
  };
  "playwright.reuseBrowser" = true;
  "playwright.showTrace" = false;
  "terminal.integrated.defaultProfile.osx" = "fish";
  "database-client.autoSync" = true;
  "workbench.editor.enablePreview" = false;
  "chat.agent.enabled" = true;
  "github.copilot.nextEditSuggestions.enabled" = true;
  "git.blame.statusBarItem.enabled" = false;
  "playwright.runGlobalSetupOnEachRun" = true;
  "vsicons.dontShowNewVersionMessage" = true;
  "gitlens.graph.minimap.enabled" = false;
  "editor.editContext" = false;
  "git.openRepositoryInParentFolders" = "never";
  "diffEditor.ignoreTrimWhitespace" = false;
  "[dockercompose]" = {
    "editor.insertSpaces" = true;
    "editor.tabSize" = 2;
    "editor.autoIndent" = "advanced";
    "editor.quickSuggestions" = {
      "other" = true;
      "comments" = false;
      "strings" = true;
    };
    "editor.defaultFormatter" = "redhat.vscode-yaml";
  };
  "[github-actions-workflow]" = {
    "editor.defaultFormatter" = "redhat.vscode-yaml";
  };
  "gitlens.ai.model" = "vscode";
  "gitlens.ai.vscode.model" = "copilot:gpt-4.1";
  "docker.extension.enableComposeLanguageServer" = false;
}

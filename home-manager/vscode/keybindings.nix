[
  {
    key = "shift+cmd+space";
    command = "editor.emmet.action.wrapWithAbbreviation";
  }
  {
    key = "ctrl+n";
    command = "explorer.newFile";
  }
  {
    key = "ctrl+p";
    command = "workbench.action.quickOpen";
  }
  {
    key = "cmd+p";
    command = "-workbench.action.quickOpen";
  }
  {
    key = "ctrl+/";
    command = "editor.action.commentLine";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "cmd+/";
    command = "-editor.action.commentLine";
    when = "editorTextFocus && !editorReadonly";
  }
  {
    key = "ctrl+w";
    command = "workbench.action.closeActiveEditor";
  }
  {
    key = "cmd+w";
    command = "-workbench.action.closeActiveEditor";
  }
  {
    key = "ctrl+e";
    command = "workbench.view.explorer";
    when = "viewContainer.workbench.view.explorer.enabled";
  }
  {
    key = "shift+cmd+e";
    command = "-workbench.view.explorer";
    when = "viewContainer.workbench.view.explorer.enabled";
  }
  {
    key = "ctrl+t";
    command = "workbench.action.focusActiveEditorGroup";
    when = "terminalFocus";
  }
  {
    key = "ctrl+t";
    command = "workbench.action.terminal.focus";
    when = "editorFocus";
  }
  {
    key = "Ctrl+3";
    command = "workbench.action.tasks.runTask";
    args = "rust: cargo run";
  }
  {
    key = "cmd+v";
    command = "-workbench.action.terminal.paste";
    when = "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported";
  }
  {
    key = "ctrl+c";
    command = "editor.action.clipboardCopyAction";
    when = "sideBarFocus";
  }
  {
    key = "ctrl+v";
    command = "editor.action.clipboardPasteAction";
    when = "sideBarFocus";
  }
  {
    key = "ctrl+shift+alt+cmd+r";
    command = "editor.action.insertSnippet";
    args = {
      langId = "markdown";
      name = "rust";
    };
    when = "editorTextFocus && editorLangId == 'markdown'";
  }
  {
    key = "ctrl+shift+alt+cmd+l";
    command = "markdown.extension.editing.toggleList";
    when = "editorTextFocus && editorLangId == 'markdown'";
  }
  {
    key = "ctrl+shift+alt+cmd+a";
    command = "md-shortcut.toggleTitleH1";
    when = "editorTextFocus && editorLangId == 'markdown'";
  }
  {
    key = "ctrl+shift+alt+cmd+s";
    command = "md-shortcut.toggleTitleH2";
    when = "editorTextFocus && editorLangId == 'markdown'";
  }
  {
    key = "ctrl+shift+alt+cmd+d";
    command = "md-shortcut.toggleTitleH3";
    when = "editorTextFocus && editorLangId == 'markdown'";
  }
  {
    key = "ctrl+/";
    command = "vscode-neovim.send";
    when = "editorTextFocus && neovim.init && neovim.mode == visual";
    args = "<C-/>";
  }
  {
    key = "ctrl+n";
    command = "-cursorDown";
    when = "textInputFocus";
  }
  {
    key = "ctrl+shift+i";
    command = "editor.action.sourceAction";
    args = {
      kind = "source.addMissingImports";
      apply = "first";
    };
  }
  {
    key = "ctrl+shift+alt+cmd+p";
    command = "git.pull";
  }
  {
    key = "ctrl+shift+alt+cmd+c";
    command = "git.checkout";
  }
  {
    key = "ctrl+shift+alt+cmd+g";
    command = "git-graph.view";
  }
  {
    key = "shift+cmd+g";
    command = "pr:github.focus";
  }
  {
    key = "ctrl+shift+alt+cmd+i";
    command = "inlineChat.start";
    when = "editorFocus && inlineChatHasProvider && inlineChatPossible && !editorReadonly && !editorSimpleInput";
  }
  {
    key = "cmd+i";
    command = "-inlineChat.start";
    when = "editorFocus && inlineChatHasProvider && inlineChatPossible && !editorReadonly && !editorSimpleInput";
  }
  {
    key = "shift+cmd+x";
    command = "claude-dev.SidebarProvider.focus";
  }
  {
    key = "shift+cmd+c";
    command = "copyRelativeFilePath";
    when = "!editorFocus";
  }
  {
    key = "shift+alt+cmd+c";
    command = "-copyRelativeFilePath";
    when = "!editorFocus";
  }
  {
    key = "shift+cmd+c";
    command = "copyRelativeFilePath";
    when = "editorFocus";
  }
  {
    key = "cmd+k shift+alt+cmd+c";
    command = "-copyRelativeFilePath";
    when = "editorFocus";
  }
  {
    key = "shift+cmd+c";
    command = "-workbench.action.terminal.openNativeConsole";
    when = "!terminalFocus";
  }
  {
    key = "shift+cmd+x";
    command = "-workbench.view.extensions";
    when = "viewContainer.workbench.view.extensions.enabled";
  }
  {
    key = "escape";
    command = "-extension.vim_escape";
    when = "editorTextFocus && vim.active && !inDebugRepl";
  }
  {
    key = "tab";
    command = "-acceptSelectedSuggestion";
    when = "suggestWidgetHasFocusedSuggestion && suggestWidgetVisible && textInputFocus";
  }
  {
    key = "tab";
    command = "-extension.vim_tab";
    when = "editorTextFocus && vim.active && !inDebugRepl && vim.mode != 'Insert'";
  }
  {
    key = "tab";
    command = "editor.action.inlineSuggest.commit";
    when = "inlineEditIsVisible && tabShouldAcceptInlineEdit && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineEditIsVisible && inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineEditIsVisible && inlineSuggestionVisible && tabShouldAcceptInlineEdit && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible";
  }
  {
    key = "tab";
    command = "-editor.action.inlineSuggest.commit";
    when = "inlineEditIsVisible && tabShouldAcceptInlineEdit && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineEditIsVisible && inlineSuggestionHasIndentationLessThanTabSize && inlineSuggestionVisible && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible || inlineEditIsVisible && inlineSuggestionVisible && tabShouldAcceptInlineEdit && !editorHoverFocused && !editorTabMovesFocus && suggestWidgetVisible";
  }
  {
    key = "tab";
    command = "-hsnips.nextPlaceholder";
    when = "editorTextFocus && hasNextTabstop && inSnippetMode && !suggestWidgetVisible";
  }
  {
    key = "shift+tab";
    command = "-hsnips.prevPlaceholder";
    when = "editorTextFocus && hasPrevTabstop && inSnippetMode && !suggestWidgetVisible";
  }
  {
    key = "cmd+j";
    command = "-workbench.action.togglePanel";
  }
  {
    key = "shift+enter";
    command = "workbench.action.terminal.sendSequence";
    args = {
      text = "\\\r\n";
    };
    when = "terminalFocus";
  }
]

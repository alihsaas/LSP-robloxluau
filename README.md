# LSP-robloxluau

A language client for RobloxLuau. This package will download and unpack the robloxluau-language-server in `$DATA/Package Storage/LSP-robloxluau`.

To use this package, you must have:

- The [LSP](https://packagecontrol.io/packages/LSP) package.

# Applicable Selectors

This language server operates on files with the `source.lua` base scope.

# Configuration

Run `Preferences: LSP-robloxluau Settings` from the Command Palette.

# Locale

You can make this language server report documentation in English or Chinese. The default is English. To change it
into Chinese, run the command `Preferences: LSP-robloxluau Settings` and change the `"locale"` key.

# Disabling Diagnostics via Code Actions

This language server allows you to disable diagnostics by means of a Code Action. You can run the "Code Action" and the client (this package) is supposed to modify the settings to add or remove the unwanted diagnostic. This package implements that by editing your .sublime-project file. So in order for this to work, you need to have your window be backed by a .sublime-project file. [Learn more about projects here](https://www.sublimetext.com/docs/projects.html).
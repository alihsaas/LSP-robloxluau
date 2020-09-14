from LSP.plugin import AbstractPlugin
from LSP.plugin.core.typing import Dict, Optional
import sublime


class Luau(AbstractPlugin):
    @classmethod
    def name(cls) -> str:
        return cls.__name__.lower()

    @classmethod
    def additional_variables(cls) -> Optional[Dict[str, str]]:
        binplatform = {
                "linux": "Linux",
                "windows": "Windows",
                "osx": "macOS"
        }[sublime.platform()]
        return {
            "binplatform": binplatform,
            "locale": str(sublime.load_settings("LSP-luau.sublime-settings").get("locale"))
        }

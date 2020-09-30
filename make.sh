set -e

VSCODE_LUA_DIR="${GITHUB_WORKSPACE}/roblox-lsp"
LSP_LUA_SOURCE_DIR="${GITHUB_WORKSPACE}/LSP-robloxluau-source"

function process
{
    local OUT_DIR="${GITHUB_WORKSPACE}/out/LSP-robloxluau_$1"
    local OUT_BIN_DIR="${OUT_DIR}/bin/$2"
    local BIN_DIR="${VSCODE_LUA_DIR}/server/bin/$2"
    mkdir -p "${OUT_BIN_DIR}"
    cp "${BIN_DIR}"/* "${OUT_BIN_DIR}"/
    chmod +x "${OUT_BIN_DIR}"/*
    cp -R "${VSCODE_LUA_DIR}/server/libs" "${OUT_DIR}/"
    cp -R "${VSCODE_LUA_DIR}/server/locale" "${OUT_DIR}/"
    cp -R "${VSCODE_LUA_DIR}/server/script" "${OUT_DIR}/"
    cp "${VSCODE_LUA_DIR}/server/main.lua" "${OUT_DIR}/"
    cp "${VSCODE_LUA_DIR}/server/platform.lua" "${OUT_DIR}/"
    cp "${LSP_LUA_SOURCE_DIR}/plugin.py" "${OUT_DIR}/"
    cp "${LSP_LUA_SOURCE_DIR}/LSP-robloxluau.sublime-commands" "${OUT_DIR}/"
    cp "${LSP_LUA_SOURCE_DIR}/LSP-robloxluau.sublime-settings" "${OUT_DIR}/"
    cp "${LSP_LUA_SOURCE_DIR}/LICENSE" "${OUT_DIR}/"
    cp "${LSP_LUA_SOURCE_DIR}/NOTICE" "${OUT_DIR}/"
    touch "${OUT_DIR}/.no-sublime-package"
    patch "${OUT_DIR}/main.lua" "${LSP_LUA_SOURCE_DIR}/patch.diff"
    pushd "${OUT_DIR}"
        zip -q -r "${GITHUB_WORKSPACE}/LSP-robloxluau_$1.zip" .
    popd # "${OUT_DIR}"
    ls -lash "${GITHUB_WORKSPACE}/LSP-robloxluau_$1.zip"
}

process linux-x64 Linux
process osx-x64 macOS
process windows-x64 Windows
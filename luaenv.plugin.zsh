# SPDX-License-Identifier: MIT
luaenvdirs=("$HOME/.luaenv" "$XDG_DATA_HOME/luaenv" "/usr/local/luaenv" "/opt/luaenv" "/usr/local/opt/luaenv")

FOUND_LUAENV=0
for luaenvdir in $luaenvdirs; do
    if [[ -d "${luaenvdir}/bin" ]]; then
        FOUND_LUAENV=1
        break
    fi
done


if [[ $FOUND_LUAENV -eq 0 ]]; then
    if (( $+commands[brew] )) && luaenvdir="$(brew --prefix luaenv)"; then
        [[ -d "${luaenvdir}/bin" ]] && FOUND_LUAENV=1
    fi
fi

if [[ $FOUND_LUAENV -eq 1 ]]; then
    (( $+commands[luaenv] )) || export PATH="${luaenvdir}/bin:$PATH"
    eval "$(luaenv init -)"

    function luaenv_prompt_info() {
      local version="$(luaenv version-name 2>/dev/null)"
      echo "${version:gs/%/%%}"
    }

    if [[ -d "${luaenvdir}/versions" ]]; then
        export LUAENV_ROOT=$luaenvdir
    fi
else
    function luaenv_prompt_info() {
      local version="$(lua -v | cut -d' ' -f2)"
      echo "system: ${version:gs/%/%%}"
    }
fi

unset luaenvdir luaenvdirs FOUND_LUAENV

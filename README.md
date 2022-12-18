# zsh-luaenv

Another zsh plugin for luaenv based the oh-my-zsh version of luaenv plugin with
modifications from the rbenv and jenv plugins.

## Usage

To use it, install [`luaenv`](https://github.com/cehoffman/luaenv) first.

Then clone this repository into the custom plugins directory as `pyenv` of your
zsh plugin manager which is `$ZSH_CUSTOM`, the following is for
[Oh My Zsh](https://ohmyz.sh/) which is `~/.oh-my-zsh/custom/plugins`.

```bash
git clone https://github.com/TwoPizza9621536/zsh-luaenv.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/luaenv
```

Finally, add luaenv to the plugins array of your zshrc file:

```bash
plugins=(... luaenv)
```

## License

Under the MIT License with the following SPDX expression:

```text
SPDX-License-Identifier: MIT
```

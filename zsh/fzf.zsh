_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="239"
  local base00="240"
  local base0="244"
  local base1="245"
  local base2="187"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="124"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  export FZF_DEFAULT_OPTS="
  --color fg:$base01,bg:$base03,hl:$blue,fg+:$base1,bg+:$base02,hl+:$blue
  --color info:$cyan,prompt:$base1,pointer:$base00,marker:$base00,spinner:$yellow
  "
}

_gen_fzf_default_opts

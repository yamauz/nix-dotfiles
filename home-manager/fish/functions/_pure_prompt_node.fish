function _pure_prompt_node
    if test -f package.json; or test -f .nvmrc; or test -f .node-version
        set -l node_version (node --version 2>/dev/null)
        if test -n "$node_version"
            set -l icon (printf '\ue718')
            echo (set_color a6d189)"$icon $node_version"(set_color normal)
        end
    end
end

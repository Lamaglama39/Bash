################################################################################
# Script Name  : PS1_animals
# Discription  : Animals appear at the prompt.
#                The selection of animals reflects the author's preference.
# How to : Please add to the .bashrc
################################################################################

#emoji
function _line_separater() {
    echo -e '\U2500 \U2500 \U2500 \U2500'
}

function _random_symbol() {
    local symbols=(
        '\U1F980'   # :crab:
        '\U1F990'   # :shrinp:
        '\U1F991'   # :squid:
        '\U1F99E'   # :robster:
        '\U1F40A'   # :crocodile:
        '\U1F40C'   # :snail:
        '\U1F40F'   # :ram:
        '\U1F411'   # :sheep:
        '\U1F419'   # :octopus:
        '\U1F41B'   # :bug:
        '\U1F422'   # :turtle:
        '\U1F424'   # :baby chick:
        '\U1F427'   # :penguin:
        '\U1F42A'   # :dromedary camel:
        '\U1F43F'   # :chipmunk:
        '\U1F98E'   # :lizard:
        '\U1F999'   # :llama:
        '\U1F9A5'   # :sloth:
        '\U1F9A6'   # :otter:
        '\U1F9A9'   # :flamingo:
    )
    echo -ne "${symbols[$(($RANDOM % ${#symbols[@]}))]}"
}

export PS1='$(_line_separater)\n$(_random_symbol)$(_random_symbol)$(_random_symbol) :\w\$ '
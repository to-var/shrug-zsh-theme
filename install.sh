#!/bin/bash

# Colors
RED="\033[0;31m"
ORANGE="\033[0;33m"
GREEN="\033[0;32m"
NC="\033[0m"

# Messages
OK="[OK]"
FAIL="[FAIL]"
STEP_1="Copying to oh-my-zsh theme folder..."
STEP_2="Finding zsh theme option..."
STEP_3="Replacing theme..."

# Config
ZSH_THEME_OPTION="ZSH_THEME"

# Other
SUCCESS_COUNT=0
SUCCESS_EXPECTED=3
THEME_CONFIG_LINE=$(grep -n "${ZSH_THEME_OPTION}" ~/.zshrc -m 1| cut -d: -f 1)

printResult() {
    if [ $1 == true ]; then
        SUCCESS_COUNT=$((SUCCESS_COUNT + 1))
        echo $GREEN$OK $NC$2
    else
        SUCCESS_COUNT=$((SUCCESS_COUNT - 1))
        echo $RED$FAIL $NC$2
    fi
}

installTheme() {
    THEME_NAME=$1
    # Welcome message
    echo $GREEN
    cat shrug
    echo $NC

    echo "Installing ${THEME_NAME} theme:"
    if cp ${THEME_NAME}.zsh-theme ~/.oh-my-zsh/themes/; then
        printResult true "$STEP_1"
    else
        printResult false "$STEP_1"
    fi

    if [ $THEME_CONFIG_LINE -gt 0 ]; then
        printResult true "$STEP_2"
        if sed -E -i .bak "s/${ZSH_THEME_OPTION}=\"(.*)\"/${ZSH_THEME_OPTION}=\"${THEME_NAME}\"/" ~/.zshrc; then
            printResult true "$STEP_3"
        else
            printResult false "$STEP_3"
        fi
    else
        printResult false "$STEP_2"
    fi

    if [ $SUCCESS_COUNT == $SUCCESS_EXPECTED ]; then
        echo "\nTheme ${THEME_NAME} has been successfully installed!"
        echo "it should be available when you open a new"
        echo "terminal window"
    else
        echo "\nIt looks like there was an error"
        echo "please feel free to post an issue on:"
        echo "https://github.com/to-var/shrug-zsh-theme/issues/new"
    fi

    echo "------------------------------------------"
}

if [ $# -eq 0 ]; then
    printResult false "No arguments supplied, try the following"
    echo "\$ ${ORANGE}sh install.sh [theme name]${NC}"
else
    installTheme $1
fi

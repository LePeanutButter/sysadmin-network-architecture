#!/bin/bash
#===============================================================================
# Script Name   : network_info_menu.sh
# Description   : Displays various network information using system commands.
# Author        : LePeanutButter, Lanapequin
# Created       : 2025-11-20
# License       : MIT License
#===============================================================================

# Exit immediately on error
set -e

# Trap unexpected errors
trap 'echo "An unexpected error occurred. Exiting."; exit 1' ERR

# Logging with timestamps
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Verify if a command exists in system
check_cmd() {
    command -v "$1" >/dev/null 2>&1 || { echo "Command '$1' not found."; exit 1; }
}

#========================
# Display Network Summary
#========================
show_interfaces() {
    if command -v ip >/dev/null 2>&1; then
        ip addr show
    else
        ifconfig -a
    fi
}

#========================
# Display Routing Table
#========================
show_routes() {
    if command -v ip >/dev/null 2>&1; then
        ip route show
    else
        netstat -rn
    fi
}

#========================
# Display Active Connections
#========================
show_connections() {
    netstat -tulnp 2>/dev/null || netstat -an
}

#========================
# Display Interface Statistics
#========================
show_statistics() {
    OS=$(uname -s)

    # PATH FOR NON-LINUX (SOLARIS, BSD, AIX, etc.)
    if [ "$OS" != "Linux" ]; then

        if netstat -i 2>/dev/null; then
            return 0
        else
            echo "netstat -i failed or unavailable."
        fi

        echo "No supported interface statistics available."
        return 1
    fi

    # Linux Path
    if command -v ethtool >/dev/null 2>&1; then
        if command -v ip >/dev/null 2>&1; then
            INTERFACE_LIST=$(ip -o link show | awk -F': ' '{print $2}')
        else
            INTERFACE_LIST=$(ifconfig -a 2>/dev/null | awk '/^[a-zA-Z0-9]+[0-9]*:/ {print $1}' | sed 's/://')
        fi

        for iface in $INTERFACE_LIST; do
            echo "---- $iface ----"
            ethtool "$iface" 2>/dev/null || echo "No ethtool data for $iface"
            echo
        done
        return 0
    fi

    # vnstat fallback
    if command -v vnstat >/dev/null 2>&1; then
        vnstat
        return 0
    fi

    # Generic fallback
    echo "Falling back to netstat -i..."
    netstat -i
}

#========================
# Display Network Summary Report
#========================
show_summary() {
    log "Generating summarized network report..."
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime | cut -d',' -f1)"
    
    if command -v ip >/dev/null 2>&1; then
        DEFAULT_GW=$(ip route show default 2>/dev/null | awk '/default/ {print $3}' | head -1)
    else
        DEFAULT_GW=$(route -n get default 2>/dev/null | awk '/gateway:/ {print $2}' || route -n | awk '/UG/ {print $2}' | head -1)
    fi
    
    echo "Default Gateway: ${DEFAULT_GW:-Not Found}"

    echo "Active Interfaces and IP Addresses:"
    if command -v ip >/dev/null 2>&1; then
        ip -o -4 addr show | awk '{print $2": "$4}'
    else
        ifconfig -a 2>/dev/null | awk '/^[a-zA-Z0-9]+:|^[a-zA-Z0-9]+ / {iface=$1} /inet / {print iface $2}' | sed 's/[:]/ /g' | awk '{print $1": "$2}'
    fi
}

#========================
# Clear screen function (POSIX)
#========================
clear_screen() {
    printf '\033c'
}

#========================
# Main Menu
#========================
while true; do
    clear_screen
    echo
    echo "Network Information Menu:"
    echo "1) Show interfaces and IP addresses"
    echo "2) Show routing table"
    echo "3) Show active network connections"
    echo "4) Show interface statistics"
    echo "5) Show summarized network report"
    echo "6) Exit"
    read -rp "Select an option [1-6]: " opt

    case "$opt" in
        1) show_interfaces ;;
        2) show_routes ;;
        3) show_connections ;;
        4) show_statistics ;;
        5) show_summary ;;
        6) log "Exiting script."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    printf "\nPress Enter to continue..."
    read dummy
done

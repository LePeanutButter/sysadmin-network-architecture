#!/bin/bash
#===============================================================================
# Script Name   : port_check.sh
# Description   : Checks whether a given TCP/UDP port is open on localhost and identifies service.
# Author        : LePeanutButter, Lanapequin
# Created       : 2025-11-20
# License       : MIT License
#===============================================================================

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

usage() {
    echo "Usage: $0 <port>"
    echo "Checks if a port is open on localhost (127.0.0.1)."
    echo "Example: $0 80"
    exit 1
}

[ $# -ne 1 ] && usage

HOST="localhost"
PORT=$1

# Validate numeric port
case $PORT in
    ''|*[!0-9]*) echo "Error: Port must be numeric."; exit 1 ;;
esac

PORT_OPEN=0

# Prefer nc
if command -v nc >/dev/null 2>&1 && nc -z -w3 "$HOST" "$PORT" >/dev/null 2>&1; then
    PORT_OPEN=1

# Fallback 1: nmap
elif command -v nmap >/dev/null 2>&1; then
    if nmap -p "$PORT" "$HOST" 2>/dev/null | grep -q "open"; then
        PORT_OPEN=1
    fi

# Fallback 2: telnet
elif command -v telnet >/dev/null 2>&1; then
    if echo -e "\x1d\x0a" | telnet "$HOST" "$PORT" 2>/dev/null | grep -q "Connected"; then
        PORT_OPEN=1
    fi

# Fallback 3: netstat
elif command -v netstat >/dev/null 2>&1; then
    if netstat -an 2>/dev/null | grep ":$PORT" | grep -qi "listen"; then
        PORT_OPEN=1
    fi
fi

# Find real services file (Solaris uses /etc/inet/services)
if [ -f /etc/inet/services ]; then
    SERVICES_FILE="/etc/inet/services"
else
    SERVICES_FILE="/etc/services"
fi

lookup_service_shell() {
    while IFS= read -r line; do
        case "$line" in
            ""|\#*) continue ;;
        esac

        case "$line" in
            *"#"*)
                line=${line%%#*}
                ;;
        esac

        line=$(printf "%s" "$line" | tr '\t' ' ')

        set -- $line

        svc="$1"
        pp="$2"

        proto_port=${pp%/*}

        if [ "$proto_port" = "$PORT" ]; then
            echo "$svc"
            return
        fi
    done < "$SERVICES_FILE"

    return 1
}

# Service lookup (Solaris/Slackware compatible)
if [ "$PORT_OPEN" -eq 1 ]; then
    SERVICE=$(lookup_service_shell)

    if [ -n "$SERVICE" ]; then
        echo "Port $PORT is OPEN. Service: **$SERVICE**"
    else
        echo "Port $PORT is OPEN. Service: **Unknown** (Not found in $SERVICES_FILE)"
    fi
else
    echo "Port $PORT is **CLOSED**."
fi
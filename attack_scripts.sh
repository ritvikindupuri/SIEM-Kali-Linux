#!/bin/bash

# A script to automate the execution of simulated attacks for SIEM testing.

echo "--- Starting Cyber Attack Simulation ---"

# --- Scenario 1: Nmap Port Scan ---
echo ""
echo " [ATTACK] Executing Nmap service scan against localhost..."
echo "This will test the 'Port Scanning Detection Rule'."
sudo nmap -A -sV localhost
echo " Nmap scan complete."
echo ""

# --- Scenario 2: Hydra SSH Brute-Force ---
echo " [ATTACK] Executing Hydra SSH brute-force attack against localhost..."
echo "This will test the pre-built 'SSH Brute Force' detection rule."

# Create a dummy user and password list for the test
echo "testuser" > user.txt
echo "password123" > password.txt
echo "testpass" >> password.txt
echo "admin" >> password.txt

# IMPORTANT: Ensure the target machine has an SSH server running.
hydra -L user.txt -P password.txt localhost ssh

echo " Hydra scan complete."
echo ""
echo "--- Simulation Finished ---"

# Clean up dummy files
rm user.txt password.txt

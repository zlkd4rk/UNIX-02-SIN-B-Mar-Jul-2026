#!/bin/bash

# We assign the first argument received to the variable NAME
NAME="${1}"
# We assign the second argument received to the DOMAIN variable
DOMAIN="${2}"
# We define the name of the file where we will save the data
OUTPUT_FILE="results.csv"


if [[ -z "${NAME}" ]] || [[ -z "${DOMAIN}" ]]; then
  # Si falta alguno, mostramos un error y salimos con código 1 (error)
  echo "Uso: ${0} <nombre> <dominio>"
  exit 1
fi

# We check if the file does NOT exist to create the header (avoid overwriting)
if [[ ! -f "${OUTPUT_FILE}" ]]; then
  echo "status,name,domain,timestamp" > "${OUTPUT_FILE}"
fi

# We execute a single ping (-c 1) to the specified domain.

# The result is sent to /dev/null so it is not displayed on the screen.

# If the command is successful, it is added to the 'then' branch.
if ping -c 1 "${DOMAIN}" &> /dev/null; then
  STATUS="success"
else
  # If the ping fails, we define the state as 'failure'
  STATUS="failure"
fi

# We add (>>) a new line with the data to the CSV file
echo "${STATUS},${NAME},${DOMAIN},$(date)" >> "${OUTPUT_FILE}"
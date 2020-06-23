#!/usr/bin/env bash
PATH="/usr/bin:$PATH"

IFS=,
echo $@ |
  awk '
    BEGIN{
      FPAT = "([^[:space:]]+)|(\"[^\"]+\")"
    }
    {
      for(i=1;i<=NF;i++)
        print $i","
    }' |
  sed 's/"//g' |
  while read -r archivo
    do
      ARCHIVO="$(cygpath ''''$archivo'''')"
      RUTA="$(dirname "${ARCHIVO}")"
      EXTENSION="$(echo "${ARCHIVO}" | awk -F'.' '{print $NF}')"
      NOMBREBASE="$(basename "${ARCHIVO}" ".${EXTENSION}")"
      echo "${RUTA} + ${NOMBREBASE} + ${EXTENSION}"
      cd "${RUTA}"
      echo "Resizing ${NOMBREBASE}.${EXTENSION}"
      convert "${NOMBREBASE}.${EXTENSION}" -resize "50%" "${NOMBREBASE}_half.${EXTENSION}"
    done

echo ""
echo "Press Enter to exit"
read
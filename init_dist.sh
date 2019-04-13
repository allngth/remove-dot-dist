#!/bin/bash

recursiverm() {
  for d in *; do
    if [ -d "$d" ]; then
      (cd -- "$d" && recursiverm)
    fi

    fileLength=`expr ${#d} - 5`;

    if [ $fileLength \> 1 ]; then
        fileExt=${d:$fileLength}

        if [ $fileExt == ".dist" ]; then
            cp $d ${d:0:$fileLength};
        fi
    fi
#
  done
}

(cd ./; recursiverm)

exit 0;
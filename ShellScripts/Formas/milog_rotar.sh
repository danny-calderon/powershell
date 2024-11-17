#!/bin/bash
#script para rotar un log
rotar()
{
    if[ -s old_rot/$FICH.rot4.gz ]
        then rm old_rot/$FICH.rot4.gz

    if[ -s old_rot/$FICH.rot3.gz ]
        then mv old_rot/$FICH.rot4.gz

    if[ -s old_rot/$FICH.rot2.gz ]
        then mv old_rot/$FICH.rot3.gz

    if[ -s old_rot/$FICH.rot1.gz ]
        then mv old_rot/$FICH.rot2.gz
    cp $FICH old_rot/$FICH.rot1
    gzip old_rot/$FICH.rot1
    > $FICH
}

mkdri old_rot 2> /dev/null
for FICH in `ls *.log`
do
    LINEAS=`cat $FICH | wc -l`
    if [ $LINEAS -gt 50 ]
        then
            echo "$FICH tiene $LINEAS ==> lo voy a rotar"
            rotar
        else
            echo "$FICH tiene $LINEAS"
    fi
done
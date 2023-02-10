#!/bin/bash

# code that takes in a model and spits out skus
Model=$1

female_last="050 055 060 065 070 075 080 085 090 095 100 105 110 115"
male_last="120 125 135 145"
both_last="$female_last $male_last"

case $Model in

  HALO)
    color_codes="OBHG ABSG MPMW PGHG FGOW GPIB EGLB APCO CPNP"
    colors_with_both_last="OBHG PGHG"
    prefix="LZ-SK-HALO-TNG-"
    ;;

  SIRN)
    color_codes="OBLK GBWN NPUR GPMB COAP LBVG RROB"
    colors_with_both_last="OBLK"
    prefix="LZ-BT-SIRN-XXX-"
    ;;

  COSM)
    color_codes="OBLK CBLU CPUR SPNK LBLU DGRN"
    colors_with_both_last=""
    prefix="LZ-BT-COSM-XXX-"
    ;;

  LUNA)
    color_codes="XWBB XBGB XORP XPBG XWPB XTBB"
    colors_with_both_last=""
    prefix="LZ-BT-COSM-XXX-"
    ;;

  HYPE)
    color_codes="OBLK SBLU CPUR SGRN SPNK CBLU IBLU SORG"
    colors_with_both_last="OLBK SBLU"    
    prefix="LZ-SK-HYPE-FST-"
    ;;
esac

for color in $color_codes; do
  if [[ "$colors_with_both_last" =~ .*"$color".* ]]; then
    for size in $both_last; do
      echo "$prefix$color-$size"
    done
  else
    for size in $female_last; do
      echo "$prefix$color-$size"
    done
  fi
done


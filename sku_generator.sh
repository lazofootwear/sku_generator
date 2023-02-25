#!/opt/homebrew/bin/bash

# code that takes in a model a last (either F, M, or B) and spits out a description
Model=$1

Last=$2

#pass in either an L or a Q
Loud_or_Quiet=$3

female_last="050 055 060 065 070 075 080 085 090 095 100 105 110 115"
male_last="120 125 135 145"
both_last="$female_last $male_last"

#setup an associative array to map color code to color description
declare -A map_color_code_to_color_description=()

#HALO
map_color_code_to_color_description[OBHG]="Obsidian Black/Hematite Grey"
map_color_code_to_color_description[ABSG]="Aquamarine Blue/Smokey Quartz Grey"
map_color_code_to_color_description[MPMW]="Morganite Pink/Milky Way White"
map_color_code_to_color_description[PGHG]="Pyrite Grey/Hematite Grey"
map_color_code_to_color_description[FGOW]="Flourite Green/Opal White"
map_color_code_to_color_description[GPIB]="Galaxy Purple/Iolite Blue"
map_color_code_to_color_description[EGLB]="Emerald Green/Labradorite Blue"
map_color_code_to_color_description[APCO]="Andromeda Pink/Carnelian Orange"
map_color_code_to_color_description[CPNP]="Cosmic Pink/Nebula Purple"

#SIRN
map_color_code_to_color_description[OBLK]="Obsidian Black"
map_color_code_to_color_description[GBWN]="Goldstone Brown"
map_color_code_to_color_description[NPUR]="Nebula Purple"
map_color_code_to_color_description[GPMB]="Galaxy Purple/Moonstone Blue"
map_color_code_to_color_description[COAP]="Carnelian Orange/Andromeda Pink"
map_color_code_to_color_description[LBVG]="Labradorite Blue/Verdite Green"
map_color_code_to_color_description[RROB]="Rhodolite Red/Obsidian Black"

#COSM
#map_color_code_to_color_description[OBLK]="Obsidian Black"
map_color_code_to_color_description[CBLU]="Celestite Blue"
map_color_code_to_color_description[CPUR]="Cartwheel Purple"
map_color_code_to_color_description[SPNK]="Supernova Pink"
map_color_code_to_color_description[LBLU]="Labradorite Blue"
map_color_code_to_color_description[DGRN]="Dioptase Green"

#LUNA
map_color_code_to_color_description[XWBB]="Milky Way White/Labradorite Blue/Moonstone Blue"
map_color_code_to_color_description[XBGB]="Asteroid Brown/Moldavite Green/Obsidian Black"
map_color_code_to_color_description[XORP]="Sunstone Orange/Garnet Red/Supernova Pink"
map_color_code_to_color_description[XPBG]="Rose Quartz Pink/Kyanite Blue/Serpentine Green"
map_color_code_to_color_description[XWPB]="Opal White/Morganite Pink/Labradorite Blue"
map_color_code_to_color_description[XTBB]="Quartz Tan/Obsidian Black/Goldstone Brown"

#HYPE
#map_color_code_to_color_description[OBLK]="Obsidian Black"
map_color_code_to_color_description[SBLU]="Sapphire Blue"
#map_color_code_to_color_description[CPUR]="Cartwheel Purple"
map_color_code_to_color_description[SGRN]="Serpentine Green"
#map_color_code_to_color_description[SPNK]="Supernova Pink"
#map_color_code_to_color_description[CBLU]="Celestite Blue"
map_color_code_to_color_description[IBLU]="Iolite Blue"
map_color_code_to_color_description[SORG]="Sunstone Orange"



declare -A map_size_code_to_size_description=()

map_size_code_to_size_description[050]="Size 5"
map_size_code_to_size_description[055]="Size 5.5"
map_size_code_to_size_description[060]="Size 6"
map_size_code_to_size_description[065]="Size 6.5"
map_size_code_to_size_description[070]="Size 7"
map_size_code_to_size_description[075]="Size 7.5"
map_size_code_to_size_description[080]="Size 8"
map_size_code_to_size_description[085]="Size 8.5"
map_size_code_to_size_description[090]="Size 9"
map_size_code_to_size_description[095]="Size 9.5"
map_size_code_to_size_description[100]="Size 10"
map_size_code_to_size_description[105]="Size 10.5"
map_size_code_to_size_description[110]="Size 11"
map_size_code_to_size_description[115]="Size 11.5"
map_size_code_to_size_description[120]="Size 12"
map_size_code_to_size_description[125]="Size 12.5"
map_size_code_to_size_description[135]="Size 13.5"
map_size_code_to_size_description[145]="Size 14.5"

case $Model in

  HALO)
    color_codes="OBHG ABSG MPMW PGHG FGOW GPIB EGLB APCO CPNP"
    colors_with_both_last="OBHG PGHG"
    sku_prefix="LZ-SK-HALO-TNG-"
    desc_prefix="Lazo Halo Sneaker Tongue Graphic "
    ;;

  SIRN)
    color_codes="OBLK GBWN NPUR GPMB COAP LBVG RROB"
    colors_with_both_last="OBLK"
    sku_prefix="LZ-BT-SIRN-XXX-"
    desc_prefix="Lazo Siren Boot "
    ;;

  COSM)
    color_codes="OBLK CBLU CPUR SPNK LBLU DGRN"
    colors_with_both_last=""
    sku_prefix="LZ-BT-COSM-XXX-"
    desc_prefix="Lazo Cosmica Boot "
    ;;

  LUNA)
    color_codes="XWBB XBGB XORP XPBG XWPB XTBB"
    colors_with_both_last=""
    sku_prefix="LZ-BT-LUNA-XXX-"
    desc_prefix="Lazo Luna Boot "
    ;;

  HYPE)
    color_codes="OBLK SBLU CPUR SGRN SPNK CBLU IBLU SORG"
    colors_with_both_last="OBLK SBLU"
    sku_prefix="LZ-SK-HYPE-FST-"
    desc_prefix="Lazo Hypernova Sneaker Firestarter Graphic "
    ;;
esac

if [[ "$Loud_or_Quiet" == "L" ]]; then
  for color in $color_codes; do
    echo "${color}=${map_color_code_to_color_description[$color]}"
  done
echo ""
fi


for color in $color_codes; do
  if [[ "$Last" == "F" ]]; then
    for size in $female_last; do
      echo "$sku_prefix$color-$size,$desc_prefix${map_color_code_to_color_description[$color]} ${map_size_code_to_size_description[$size]}"
    done

  elif [[ "$Last" == "M" ]]; then
    if [[ "$colors_with_both_last" =~ .*"$color".* ]]; then
      for size in $male_last; do
        echo "$sku_prefix$color-$size,$desc_prefix${map_color_code_to_color_description[$color]} ${map_size_code_to_size_description[$size]}"
      done
    fi
  fi

  if [[ "$Last" == "B" ]]; then
    if [[ "$colors_with_both_last" =~ .*"$color".* ]]; then
      for size in $both_last; do
        echo "$sku_prefix$color-$size,$desc_prefix${map_color_code_to_color_description[$color]} ${map_size_code_to_size_description[$size]}"
      done
    else
      for size in $female_last; do
        echo "$sku_prefix$color-$size,$desc_prefix${map_color_code_to_color_description[$color]} ${map_size_code_to_size_description[$size]}"
      done
    fi
  fi
done

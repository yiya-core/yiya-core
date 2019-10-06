#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

YIYAD=${YIYAD:-$SRCDIR/yiyad}
YIYACLI=${YIYACLI:-$SRCDIR/yiya-cli}
YIYATX=${YIYATX:-$SRCDIR/yiya-tx}
YIYAQT=${YIYAQT:-$SRCDIR/qt/yiya-qt}

[ ! -x $YIYAD ] && echo "$YIYAD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
YIYAVER=($($YIYACLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for yiyad if --version-string is not set,
# but has different outcomes for yiya-qt and yiya-cli.
echo "[COPYRIGHT]" > footer.h2m
$YIYAD --version | sed -n '1!p' >> footer.h2m

for cmd in $YIYAD $YIYACLI $YIYATX $YIYAQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${YIYAVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${YIYAVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m

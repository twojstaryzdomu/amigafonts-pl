#!/bin/ksh

SELF="$(basename "${0}")"
DSELF="$(dirname "${0}")"

PACKAGE=amigafonts-pl

. /etc/os-release
case ${ID} in
*bian*)
  cmd='dpkg -L'
  conffile=/etc/default/console-setup
  service=console-setup.service
;;
*suse*|*rhel*)
  cmd='rpm -ql'
  conffile=/etc/vconsole.conf
  service=systemd-vconsole-setup.service
;;
*)
  echo "${ID} not supported yet"
  exit 1
;;
esac

CONFFILE=${CONFFILE:-${conffile}}
SERVICE=${SERVICE:-${service}}

${CMD:-${cmd}} ${PACKAGE} \
| sort -R \
| grep -Po "(?<=/)[^/]*.psf$" \
| while read f; do
  egrep -q "^#?FONT=${f}$" "${CONFFILE}" \
    || tee -a  "${CONFFILE}" <<< "#FONT=${f}";
  done

cp ${DSELF}/${SELF%.*}.service /etc/systemd/system/ \
  && install -m 775 -d /etc/systemd/system/${SERVICE}.d/ \
    && ln -sf /etc/systemd/system/${SELF%.*}.service /etc/systemd/system/${SERVICE}.d/10_${SELF%.*}.conf \
      && systemctl daemon-reload \
        && echo "Now console fonts will rotate on every boot / each 'systemctl restart ${SERVICE}' invocation"

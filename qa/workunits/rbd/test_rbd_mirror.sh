#!/bin/sh -e

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --error-exitcode=42 ceph_test_rbd_mirror
else
  ceph_test_rbd_mirror
fi
exit 0

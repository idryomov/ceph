#!/usr/bin/env bash

set -ex

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --error-exitcode=42 ceph_test_rbd_mirror
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --error-exitcode=42 unittest_rbd_mirror
else
  ceph_test_rbd_mirror
fi

echo OK

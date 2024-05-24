#!/usr/bin/env bash

set -ex

if [ -n "${VALGRIND}" ]; then
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --error-exitcode=42 ceph_test_librbd
  valgrind ${VALGRIND} --suppressions=${TESTDIR}/valgrind.supp \
    --error-exitcode=42 unittest_librbd
else
  ceph_test_librbd
fi

echo OK

#!/bin/bash

function wait_for_jobs {

  # NOTE: Global variables
  # - JOBS (Associative Array)
  #     key   - PID of a background job
  #     value - An arbitrary description string
  # - FAILED_PIDS (Array)
  #     List of PIDs that had non-zero return codes

  local status=0
  local item pid pids rc
  declare -A check_pids job_list
  declare -a failed_pids running_pids

  for pid in ${!JOBS[@]}; do
    # Collect all the pids in an associative array (easier deletions)
    job_list["$pid"]=1
    echo "Started: ${JOBS[$pid]} ($pid)" >&2
  done

  while [[ -n "${!job_list[@]}" ]]; do
    running_pids=( $(jobs -rp) )
    unset check_pids
    # Populate associative array (check_pids) with remaining pids
    for item in ${!job_list[@]}; do check_pids[$item]=1; done
    for pid in ${running_pids[@]}; do
      # Still running, remove from the associative array
      unset check_pids[$pid]
    done

    # Whatever's left in check_pids has finished
    for pid in ${!check_pids[@]}; do
      wait $pid
      rc=$?
      echo "Finished: ${JOBS[$pid]} ($pid) terminated with exit code $rc" >&2
      if [[ $rc -ne 0 ]]; then
        FAILED_PIDS+=($pid)
        status=$rc
      fi
      unset job_list[$pid]
    done

    sleep 2
  done

  # Status of the last failed job (or zero if none failed)
  return $status
}

# These are used by the wait_for_jobs function
declare -A JOBS
declare -a FAILED_PIDS

#trap 'handle_exit' EXIT
trap '' SIGINT

for t in 5 6 4 7 3 8 2 9 1; do
  ( sleep $t; echo "Here is some output from $t" [[ $t -lt 7 ]] || exit $t ) &
  JOBS[$!]="sleeping $t"
done

wait_for_jobs
RC=$?

echo "Failed PIDs: ${FAILED_PIDS[@]}"

exit $RC

#! /usr/bin/bash
while getopts n:c:p: flag
do
    case "${flag}" in
        n) namespace=${OPTARG};;
        c) container=${OPTARG};;
        p) pod=${OPTARG};;
    esac
done

shift $((OPTIND - 1))
    command=$1

if ! [[ -z "$namespace" ]]; then
    namespace=" -n ${namespace}"
fi

if ! [[ -z "$container" ]]; then
    container=" -c ${container}"
fi

kubectl exec --stdin --tty ${namespace} ${container} ${pod} -- $command

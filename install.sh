#!/usr/bin/env bash

set -eo pipefail

echo -e "\033[0;92m ✅ Checking dependencies... \033[0m"
STARTTIME=$(date +%s)
curl -sL https://raw.githubusercontent.com/csantanapr/knative-kind/master/01-kind.sh | bash
curl -sL https://raw.githubusercontent.com/csantanapr/knative-kind/master/02-serving.sh | bash
curl -sL https://raw.githubusercontent.com/csantanapr/knative-kind/master/04-eventing.sh | bash
DURATION=$(($(date +%s) - $STARTTIME))
echo "kubectl get ksvc,broker,trigger"
kubectl -n default get ksvc,broker,trigger
echo -e "\033[0;92m 🚀 Knative install took: $(($DURATION / 60))m$(($DURATION % 60))s \033[0m"
echo -e "\033[0;92m 🎉 Now have some fun with Serverless and Event Driven Apps \033[0m"

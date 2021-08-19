#!/bin/bash

# for conda init
. /opt/conda/etc/profile.d/conda.sh
conda activate stargan-v2
exec flask run --host=0.0.0.0 --port=5000

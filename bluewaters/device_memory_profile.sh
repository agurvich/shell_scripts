#!/bin/bash
#ECC, TEMPERATURE, POWER, CLOCK,PIDS, SUPPORTED_CLOCKS,PAGE_RETIREMENT, ACCOUNTING, ENCODER STATS COMPUTE,PERFORMANCE
 #-f ${1}

#nvidia-smi -q -d "MEMORY,UTILIZATION" -f ${1} -l 2

#Maximum frequency of graphics (shader) clock
#"clocks.max.graphics" or "clocks.max.gr"

nvidia-smi --query-gpu="timestamp,memory.used,memory.free,utilization.memory" \
--format='csv,nounits' -f ${1}

nvidia-smi --query-gpu="timestamp,memory.used,memory.free,utilization.memory" \
--format='csv,nounits,noheader' -l 200 >> ${1}
